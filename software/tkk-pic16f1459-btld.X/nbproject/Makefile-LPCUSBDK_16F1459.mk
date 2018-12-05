#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-LPCUSBDK_16F1459.mk)" "nbproject/Makefile-local-LPCUSBDK_16F1459.mk"
include nbproject/Makefile-local-LPCUSBDK_16F1459.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=LPCUSBDK_16F1459
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=--mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=bsp/buttons.c bsp/leds.c demo_src/usb_descriptors.c demo_src/usb_events.c usb/usb_device.c usb/usb_device_hid.c demo_src/app_device_keyboard.c demo_src/app_led_usb_status.c demo_src/main.c system.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/bsp/buttons.p1 ${OBJECTDIR}/bsp/leds.p1 ${OBJECTDIR}/demo_src/usb_descriptors.p1 ${OBJECTDIR}/demo_src/usb_events.p1 ${OBJECTDIR}/usb/usb_device.p1 ${OBJECTDIR}/usb/usb_device_hid.p1 ${OBJECTDIR}/demo_src/app_device_keyboard.p1 ${OBJECTDIR}/demo_src/app_led_usb_status.p1 ${OBJECTDIR}/demo_src/main.p1 ${OBJECTDIR}/system.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/bsp/buttons.p1.d ${OBJECTDIR}/bsp/leds.p1.d ${OBJECTDIR}/demo_src/usb_descriptors.p1.d ${OBJECTDIR}/demo_src/usb_events.p1.d ${OBJECTDIR}/usb/usb_device.p1.d ${OBJECTDIR}/usb/usb_device_hid.p1.d ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d ${OBJECTDIR}/demo_src/main.p1.d ${OBJECTDIR}/system.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/bsp/buttons.p1 ${OBJECTDIR}/bsp/leds.p1 ${OBJECTDIR}/demo_src/usb_descriptors.p1 ${OBJECTDIR}/demo_src/usb_events.p1 ${OBJECTDIR}/usb/usb_device.p1 ${OBJECTDIR}/usb/usb_device_hid.p1 ${OBJECTDIR}/demo_src/app_device_keyboard.p1 ${OBJECTDIR}/demo_src/app_led_usb_status.p1 ${OBJECTDIR}/demo_src/main.p1 ${OBJECTDIR}/system.p1

# Source Files
SOURCEFILES=bsp/buttons.c bsp/leds.c demo_src/usb_descriptors.c demo_src/usb_events.c usb/usb_device.c usb/usb_device_hid.c demo_src/app_device_keyboard.c demo_src/app_led_usb_status.c demo_src/main.c system.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-LPCUSBDK_16F1459.mk dist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F1459
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/bsp/buttons.p1: bsp/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/buttons.p1.d 
	@${RM} ${OBJECTDIR}/bsp/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/bsp/buttons.p1  bsp/buttons.c 
	@-${MV} ${OBJECTDIR}/bsp/buttons.d ${OBJECTDIR}/bsp/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bsp/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/bsp/leds.p1: bsp/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/leds.p1.d 
	@${RM} ${OBJECTDIR}/bsp/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/bsp/leds.p1  bsp/leds.c 
	@-${MV} ${OBJECTDIR}/bsp/leds.d ${OBJECTDIR}/bsp/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bsp/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/usb_descriptors.p1: demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/usb_descriptors.p1  demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/demo_src/usb_descriptors.d ${OBJECTDIR}/demo_src/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/usb_events.p1: demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/usb_events.p1  demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/demo_src/usb_events.d ${OBJECTDIR}/demo_src/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb/usb_device.p1: usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/usb/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/usb/usb_device.p1  usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/usb/usb_device.d ${OBJECTDIR}/usb/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb/usb_device_hid.p1: usb/usb_device_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_device_hid.p1.d 
	@${RM} ${OBJECTDIR}/usb/usb_device_hid.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/usb/usb_device_hid.p1  usb/usb_device_hid.c 
	@-${MV} ${OBJECTDIR}/usb/usb_device_hid.d ${OBJECTDIR}/usb/usb_device_hid.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb/usb_device_hid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/app_device_keyboard.p1: demo_src/app_device_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/app_device_keyboard.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/app_device_keyboard.p1  demo_src/app_device_keyboard.c 
	@-${MV} ${OBJECTDIR}/demo_src/app_device_keyboard.d ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/app_led_usb_status.p1: demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/app_led_usb_status.p1  demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/demo_src/app_led_usb_status.d ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/main.p1: demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/main.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/main.p1  demo_src/main.c 
	@-${MV} ${OBJECTDIR}/demo_src/main.d ${OBJECTDIR}/demo_src/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/bsp/buttons.p1: bsp/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/buttons.p1.d 
	@${RM} ${OBJECTDIR}/bsp/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/bsp/buttons.p1  bsp/buttons.c 
	@-${MV} ${OBJECTDIR}/bsp/buttons.d ${OBJECTDIR}/bsp/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bsp/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/bsp/leds.p1: bsp/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/leds.p1.d 
	@${RM} ${OBJECTDIR}/bsp/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/bsp/leds.p1  bsp/leds.c 
	@-${MV} ${OBJECTDIR}/bsp/leds.d ${OBJECTDIR}/bsp/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/bsp/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/usb_descriptors.p1: demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/usb_descriptors.p1  demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/demo_src/usb_descriptors.d ${OBJECTDIR}/demo_src/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/usb_events.p1: demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/usb_events.p1  demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/demo_src/usb_events.d ${OBJECTDIR}/demo_src/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb/usb_device.p1: usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/usb/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/usb/usb_device.p1  usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/usb/usb_device.d ${OBJECTDIR}/usb/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb/usb_device_hid.p1: usb/usb_device_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_device_hid.p1.d 
	@${RM} ${OBJECTDIR}/usb/usb_device_hid.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/usb/usb_device_hid.p1  usb/usb_device_hid.c 
	@-${MV} ${OBJECTDIR}/usb/usb_device_hid.d ${OBJECTDIR}/usb/usb_device_hid.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb/usb_device_hid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/app_device_keyboard.p1: demo_src/app_device_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/app_device_keyboard.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/app_device_keyboard.p1  demo_src/app_device_keyboard.c 
	@-${MV} ${OBJECTDIR}/demo_src/app_device_keyboard.d ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/app_device_keyboard.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/app_led_usb_status.p1: demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/app_led_usb_status.p1  demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/demo_src/app_led_usb_status.d ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/demo_src/main.p1: demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/demo_src" 
	@${RM} ${OBJECTDIR}/demo_src/main.p1.d 
	@${RM} ${OBJECTDIR}/demo_src/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/demo_src/main.p1  demo_src/main.c 
	@-${MV} ${OBJECTDIR}/demo_src/main.d ${OBJECTDIR}/demo_src/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/demo_src/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=realice  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"        $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.map  --double=24 --float=24 --rom=default,-0-903 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N100 -I"." -I"bsp" -I"demo_src" -I"usb" --warn=0 --asmlist -DXPRJ_LPCUSBDK_16F1459=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x904 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,-resetbits,-download,-stackcall,+clib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/tkk-pic16f1459-btld.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/LPCUSBDK_16F1459
	${RM} -r dist/LPCUSBDK_16F1459

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
