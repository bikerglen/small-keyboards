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

/*********************************************************************
* Function: void APP_LEDUpdateUSBStatus(void);
*
* Overview: Uses one LED to indicate the status of the device on the USB bus.
*           A fast blink indicates successfully connected.  A slow pulse
*           indicates that it is still in the process of connecting.  Off
*           indicates thta it is not attached to the bus or the bus is suspended.
*           This should be called on every start of frame packet reception and
*           if a suspend/resume event occurs.
*
* PreCondition: LEDs are enabled.
*
* Input: None
*
* Output: None
*
********************************************************************/
void APP_LEDUpdateUSBStatus(void);
