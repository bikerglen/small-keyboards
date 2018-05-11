/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

To request to license the code under the MLA license (www.microchip.com/mla_license), 
please contact mla_licensing@microchip.com
*******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <stdint.h>
#include <string.h>

#include "system.h"
#include "usb.h"
#include "usb_device_hid.h"

#include "app_led_usb_status.h"

// *****************************************************************************
// *****************************************************************************
// Section: File Scope or Global Constants
// *****************************************************************************
// *****************************************************************************

//Class specific descriptor - HID Keyboard
const struct{uint8_t report[HID_RPT01_SIZE];}hid_rpt01={
{   0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x06,                    // USAGE (Keyboard)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
    0x19, 0xe0,                    //   USAGE_MINIMUM (Keyboard LeftControl)
    0x29, 0xe7,                    //   USAGE_MAXIMUM (Keyboard Right GUI)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
    0x75, 0x01,                    //   REPORT_SIZE (1)
    0x95, 0x08,                    //   REPORT_COUNT (8)
    0x81, 0x02,                    //   INPUT (Data,Var,Abs)
    0x95, 0x01,                    //   REPORT_COUNT (1)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x81, 0x03,                    //   INPUT (Cnst,Var,Abs)
    0x95, 0x05,                    //   REPORT_COUNT (5)
    0x75, 0x01,                    //   REPORT_SIZE (1)
    0x05, 0x08,                    //   USAGE_PAGE (LEDs)
    0x19, 0x01,                    //   USAGE_MINIMUM (Num Lock)
    0x29, 0x05,                    //   USAGE_MAXIMUM (Kana)
    0x91, 0x02,                    //   OUTPUT (Data,Var,Abs)
    0x95, 0x01,                    //   REPORT_COUNT (1)
    0x75, 0x03,                    //   REPORT_SIZE (3)
    0x91, 0x03,                    //   OUTPUT (Cnst,Var,Abs)
    0x95, 0x06,                    //   REPORT_COUNT (6)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x65,                    //   LOGICAL_MAXIMUM (101)
    0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
    0x19, 0x00,                    //   USAGE_MINIMUM (Reserved (no event indicated))
    0x29, 0x65,                    //   USAGE_MAXIMUM (Keyboard Application)
    0x81, 0x00,                    //   INPUT (Data,Ary,Abs)
    0xc0}                          // End Collection
};


// *****************************************************************************
// *****************************************************************************
// Section: File Scope Data Types
// *****************************************************************************
// *****************************************************************************

/* This typedef defines the only INPUT report found in the HID report
 * descriptor and gives an easy way to create the OUTPUT report. */
typedef struct __attribute__((packed))
{
    /* The union below represents the first byte of the INPUT report.  It is
     * formed by the following HID report items:
     *
     *  0x19, 0xe0, //   USAGE_MINIMUM (Keyboard LeftControl)
     *  0x29, 0xe7, //   USAGE_MAXIMUM (Keyboard Right GUI)
     *  0x15, 0x00, //   LOGICAL_MINIMUM (0)
     *  0x25, 0x01, //   LOGICAL_MAXIMUM (1)
     *  0x75, 0x01, //   REPORT_SIZE (1)
     *  0x95, 0x08, //   REPORT_COUNT (8)
     *  0x81, 0x02, //   INPUT (Data,Var,Abs)
     *
     * The report size is 1 specifying 1 bit per entry.
     * The report count is 8 specifying there are 8 entries.
     * These entries represent the Usage items between Left Control (the usage
     * minimum) and Right GUI (the usage maximum).
     */
    union __attribute__((packed))
    {
        uint8_t value;
        struct __attribute__((packed))
        {
            unsigned leftControl    :1;
            unsigned leftShift      :1;
            unsigned leftAlt        :1;
            unsigned leftGUI        :1;
            unsigned rightControl   :1;
            unsigned rightShift     :1;
            unsigned rightAlt       :1;
            unsigned rightGUI       :1;
        } bits;
    } modifiers;

    /* There is one byte of constant data/padding that is specified in the
     * input report:
     *
     *  0x95, 0x01,                    //   REPORT_COUNT (1)
     *  0x75, 0x08,                    //   REPORT_SIZE (8)
     *  0x81, 0x03,                    //   INPUT (Cnst,Var,Abs)
     */
    unsigned :8;

    /* The last INPUT item in the INPUT report is an array type.  This array
     * contains an entry for each of the keys that are currently pressed until
     * the array limit, in this case 6 concurent key presses.
     *
     *  0x95, 0x06,                    //   REPORT_COUNT (6)
     *  0x75, 0x08,                    //   REPORT_SIZE (8)
     *  0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
     *  0x25, 0x65,                    //   LOGICAL_MAXIMUM (101)
     *  0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
     *  0x19, 0x00,                    //   USAGE_MINIMUM (Reserved (no event indicated))
     *  0x29, 0x65,                    //   USAGE_MAXIMUM (Keyboard Application)
     *
     * Report count is 6 indicating that the array has 6 total entries.
     * Report size is 8 indicating each entry in the array is one byte.
     * The usage minimum indicates the lowest key value (Reserved/no event)
     * The usage maximum indicates the highest key value (Application button)
     * The logical minimum indicates the remapped value for the usage minimum:
     *   No Event has a logical value of 0.
     * The logical maximum indicates the remapped value for the usage maximum:
     *   Application button has a logical value of 101.
     *
     * In this case the logical min/max match the usage min/max so the logical
     * remapping doesn't actually change the values.
     *
     * To send a report with the 'a' key pressed (usage value of 0x04, logical
     * value in this example of 0x04 as well), then the array input would be the
     * following:
     *
     * LSB [0x04][0x00][0x00][0x00][0x00][0x00] MSB
     *
     * If the 'b' button was then pressed with the 'a' button still held down,
     * the report would then look like this:
     *
     * LSB [0x04][0x05][0x00][0x00][0x00][0x00] MSB
     *
     * If the 'a' button was then released with the 'b' button still held down,
     * the resulting array would be the following:
     *
     * LSB [0x05][0x00][0x00][0x00][0x00][0x00] MSB
     *
     * The 'a' key was removed from the array and all other items in the array
     * were shifted down. */
    uint8_t keys[6];
} KEYBOARD_INPUT_REPORT;


/* This typedef defines the only OUTPUT report found in the HID report
 * descriptor and gives an easy way to parse the OUTPUT report. */
typedef union __attribute__((packed))
{
    /* The OUTPUT report is comprised of only one byte of data. */
    uint8_t value;
    struct
    {
        /* There are two report items that form the one byte of OUTPUT report
         * data.  The first report item defines 5 LED indicators:
         *
         *  0x95, 0x05,                    //   REPORT_COUNT (5)
         *  0x75, 0x01,                    //   REPORT_SIZE (1)
         *  0x05, 0x08,                    //   USAGE_PAGE (LEDs)
         *  0x19, 0x01,                    //   USAGE_MINIMUM (Num Lock)
         *  0x29, 0x05,                    //   USAGE_MAXIMUM (Kana)
         *  0x91, 0x02,                    //   OUTPUT (Data,Var,Abs)
         *
         * The report count indicates there are 5 entries.
         * The report size is 1 indicating each entry is just one bit.
         * These items are located on the LED usage page
         * These items are all of the usages between Num Lock (the usage
         * minimum) and Kana (the usage maximum).
         */
        unsigned numLock        :1;
        unsigned capsLock       :1;
        unsigned scrollLock     :1;
        unsigned compose        :1;
        unsigned kana           :1;

        /* The second OUTPUT report item defines 3 bits of constant data
         * (padding) used to make a complete byte:
         *
         *  0x95, 0x01,                    //   REPORT_COUNT (1)
         *  0x75, 0x03,                    //   REPORT_SIZE (3)
         *  0x91, 0x03,                    //   OUTPUT (Cnst,Var,Abs)
         *
         * Report count of 1 indicates that there is one entry
         * Report size of 3 indicates the entry is 3 bits long. */
        unsigned                :3;
    } leds;
} KEYBOARD_OUTPUT_REPORT;


/* This creates a storage type for all of the information required to track the
 * current state of the keyboard. */
typedef struct
{
    USB_HANDLE lastINTransmission;
    USB_HANDLE lastOUTTransmission;
} KEYBOARD;

// *****************************************************************************
// *****************************************************************************
// Section: File Scope or Global Variables
// *****************************************************************************
// *****************************************************************************
static KEYBOARD keyboard;

#if !defined(KEYBOARD_INPUT_REPORT_DATA_BUFFER_ADDRESS_TAG)
    #define KEYBOARD_INPUT_REPORT_DATA_BUFFER_ADDRESS_TAG
#endif
static KEYBOARD_INPUT_REPORT inputReport KEYBOARD_INPUT_REPORT_DATA_BUFFER_ADDRESS_TAG;

#if !defined(KEYBOARD_OUTPUT_REPORT_DATA_BUFFER_ADDRESS_TAG)
    #define KEYBOARD_OUTPUT_REPORT_DATA_BUFFER_ADDRESS_TAG
#endif
static volatile KEYBOARD_OUTPUT_REPORT outputReport KEYBOARD_OUTPUT_REPORT_DATA_BUFFER_ADDRESS_TAG;


// *****************************************************************************
// *****************************************************************************
// Section: Private Prototypes
// *****************************************************************************
// *****************************************************************************
static void APP_KeyboardProcessOutputReport(void);


//Exteranl variables declared in other .c files
extern volatile signed int SOFCounter;


//Application variables that need wide scope
KEYBOARD_INPUT_REPORT oldInputReport;
signed int keyboardIdleRate;
signed int LocalSOFCount;
static signed int OldSOFCount;




// *****************************************************************************
// *****************************************************************************
// Section: Macros or Functions
// *****************************************************************************
// *****************************************************************************
void APP_KeyboardInit(void)
{
    //initialize the variable holding the handle for the last
    // transmission
    keyboard.lastINTransmission = 0;
    
    //Set the default idle rate to 500ms (until the host sends a SET_IDLE request to change it to a new value)
    keyboardIdleRate = 500;

    //Copy the (possibly) interrupt context SOFCounter value into a local variable.
    //Using a while() loop to do this since the SOFCounter isn't necessarily atomically
    //updated and therefore we need to read it a minimum of twice to ensure we captured the correct value.
    while(OldSOFCount != SOFCounter)
    {
        OldSOFCount = SOFCounter;
    }

    //enable the HID endpoint
    USBEnableEndpoint(HID_EP, USB_IN_ENABLED|USB_OUT_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);

    //Arm OUT endpoint so we can receive caps lock, num lock, etc. info from host
    keyboard.lastOUTTransmission = HIDRxPacket(HID_EP,(uint8_t*)&outputReport, sizeof(outputReport) );
}

void APP_KeyboardTasks(void)
{
    signed int TimeDeltaMilliseconds;
    unsigned char i;
    bool needToSendNewReportPacket;
    int keynum = 0;

    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        return;
    }

    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if( USBIsDeviceSuspended()== true )
    {
        //Check if we should assert a remote wakeup request to the USB host,
        //when the user presses the pushbutton.
        if(BUTTON_IsPressed(BUTTON_USB_DEVICE_REMOTE_WAKEUP) == 0)
        {
            //Add code here to issue a resume signal.
        }

        return;
    }
    
    //Copy the (possibly) interrupt context SOFCounter value into a local variable.
    //Using a while() loop to do this since the SOFCounter isn't necessarily atomically
    //updated and we need to read it a minimum of twice to ensure we captured the correct value.
    while(LocalSOFCount != SOFCounter)
    {
        LocalSOFCount = SOFCounter;
    }

    //Compute the elapsed time since the last input report was sent (we need
    //this info for properly obeying the HID idle rate set by the host).
    TimeDeltaMilliseconds = LocalSOFCount - OldSOFCount;
    //Check for negative value due to count wraparound back to zero.
    if(TimeDeltaMilliseconds < 0)
    {
        TimeDeltaMilliseconds = (32767 - OldSOFCount) + LocalSOFCount;
    }
    //Check if the TimeDelay is quite large.  If the idle rate is == 0 (which represents "infinity"),
    //then the TimeDeltaMilliseconds could also become infinity (which would cause overflow)
    //if there is no recent button presses or other changes occurring on the keyboard.
    //Therefore, saturate the TimeDeltaMilliseconds if it gets too large, by virtue
    //of updating the OldSOFCount, even if we haven't actually sent a packet recently.
    if(TimeDeltaMilliseconds > 5000)
    {
        OldSOFCount = LocalSOFCount - 5000;
    }


    /* Check if the IN endpoint is busy, and if it isn't check if we want to send
     * keystroke data to the host. */
    if(HIDTxHandleBusy(keyboard.lastINTransmission) == false)
    {
        /* Clear the INPUT report buffer.  Set to all zeros. */
        memset(&inputReport, 0, sizeof(inputReport));

        if(BUTTON_IsPressed(BUTTON_USB_DEVICE_HID_KEYBOARD_KEY_0) == true)
        {
            inputReport.keys[keynum++] = 0x04;
        }
        
        if(BUTTON_IsPressed(BUTTON_USB_DEVICE_HID_KEYBOARD_KEY_1) == true)
        {
            inputReport.keys[keynum++] = 0x05;
        }
        
        if(BUTTON_IsPressed(BUTTON_USB_DEVICE_HID_KEYBOARD_KEY_2) == true)
        {
            inputReport.keys[keynum++] = 0x06;
        }
        
        //Check to see if the new packet contents are somehow different from the most
        //recently sent packet contents.
        needToSendNewReportPacket = false;
        for(i = 0; i < sizeof(inputReport); i++)
        {
            if(*((uint8_t*)&oldInputReport + i) != *((uint8_t*)&inputReport + i))
            {
                needToSendNewReportPacket = true;
                break;
            }
        }

        //Check if the host has set the idle rate to something other than 0 (which is effectively "infinite").
        //If the idle rate is non-infinite, check to see if enough time has elapsed since
        //the last packet was sent, and it is time to send a new repeated packet or not.
        if(keyboardIdleRate != 0)
        {
            //Check if the idle rate time limit is met.  If so, need to send another HID input report packet to the host
            if(TimeDeltaMilliseconds >= keyboardIdleRate)
            {
                needToSendNewReportPacket = true;
            }
        }

        //Now send the new input report packet, if it is appropriate to do so (ex: new data is
        //present or the idle rate limit was met).
        if(needToSendNewReportPacket == true)
        {
            //Save the old input report packet contents.  We do this so we can detect changes in report packet content
            //useful for determining when something has changed and needs to get re-sent to the host when using
            //infinite idle rate setting.
            oldInputReport = inputReport;

            /* Send the 8 byte packet over USB to the host. */
            keyboard.lastINTransmission = HIDTxPacket(HID_EP, (uint8_t*)&inputReport, sizeof(inputReport));
            OldSOFCount = LocalSOFCount;    //Save the current time, so we know when to send the next packet (which depends in part on the idle rate setting)
        }

    }//if(HIDTxHandleBusy(keyboard.lastINTransmission) == false)


    /* Check if any data was sent from the PC to the keyboard device.  Report
     * descriptor allows host to send 1 byte of data.  Bits 0-4 are LED states,
     * bits 5-7 are unused pad bits.  The host can potentially send this OUT
     * report data through the HID OUT endpoint (EP1 OUT), or, alternatively,
     * the host may try to send LED state information by sending a SET_REPORT
     * control transfer on EP0.  See the USBHIDCBSetReportHandler() function. */
    if(HIDRxHandleBusy(keyboard.lastOUTTransmission) == false)
    {
        APP_KeyboardProcessOutputReport();

        keyboard.lastOUTTransmission = HIDRxPacket(HID_EP,(uint8_t*)&outputReport,sizeof(outputReport));
    }
    
    return;		
}

static void APP_KeyboardProcessOutputReport(void)
{
    if(outputReport.leds.capsLock)
    {
        LED_On(LED_USB_DEVICE_HID_KEYBOARD_CAPS_LOCK);
    }
    else
    {
        LED_Off(LED_USB_DEVICE_HID_KEYBOARD_CAPS_LOCK);
    }
}

static void USBHIDCBSetReportComplete(void)
{
    /* 1 byte of LED state data should now be in the CtrlTrfData buffer.  Copy
     * it to the OUTPUT report buffer for processing */
    outputReport.value = CtrlTrfData[0];

    /* Process the OUTPUT report. */
    APP_KeyboardProcessOutputReport();
}

void USBHIDCBSetReportHandler(void)
{
    /* Prepare to receive the keyboard LED state data through a SET_REPORT
     * control transfer on endpoint 0.  The host should only send 1 byte,
     * since this is all that the report descriptor allows it to send. */
    USBEP0Receive((uint8_t*)&CtrlTrfData, USB_EP0_BUFF_SIZE, USBHIDCBSetReportComplete);
}


//Callback function called by the USB stack, whenever the host sends a new SET_IDLE
//command.
void USBHIDCBSetIdleRateHandler(uint8_t reportID, uint8_t newIdleRate)
{
    //Make sure the report ID matches the keyboard input report id number.
    //If however the firmware doesn't implement/use report ID numbers,
    //then it should be == 0.
    if(reportID == 0)
    {
        keyboardIdleRate = newIdleRate;
    }
}


/*******************************************************************************
 End of File
*/
