TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = galil
# galil.dbd will be created and installed
DBD += galil.dbd
# galil.dbd will be made up from these files:
galil_DBD += base.dbd
# To send command_string to the system command interpreter for execution
galil_DBD += system.dbd
galil_DBD += galilSupport.dbd

ifdef ASYN
	galil_DBD += asyn.dbd drvAsynSerialPort.dbd
	galil_DBD += drvAsynIPPort.dbd
	galil_LIBS += asyn
endif
ifdef STD
	galil_DBD += stdSupport.dbd
	galil_LIBS += std
endif
ifdef CAPUTLOG
	galil_DBD += caPutLog.dbd
	galil_LIBS += caPutLog
endif
ifdef CALC
	galil_DBD += calcSupport.dbd
	galil_LIBS += calc
endif
ifdef BUSY
	galil_DBD += busySupport.dbd
	galil_LIBS += busy
endif
ifdef SSCAN
	galil_DBD += sscanSupport.dbd
	galil_LIBS += sscan
	ifdef SNCSEQ
		galil_DBD += sscanProgressSupport.dbd
		galil_LIBS += scanProgress
	endif
endif
ifdef AUTOSAVE
	galil_DBD += asSupport.dbd
	galil_LIBS += autosave
endif
ifdef SNCSEQ
	galil_DBD += devSequencer.dbd
	galil_LIBS += seqDev seq pv
endif
ifdef STREAM
	galil_DBD += stream.dbd
	galil_LIBS += stream 
endif
ifdef DEVIOCSTATS
	galil_DBD += devIocStats.dbd iocAdmin.dbd
	galil_LIBS += devIocStats
endif

galil_LIBS += motor
galil_SRCS += GalilController.cpp GalilAxis.cpp GalilCSAxis.cpp GalilConnector.cpp GalilPoller.cpp
galil_SRCS += galil_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
galil_SRCS_DEFAULT += galilMain.cpp

# Finally link to the EPICS Base libraries
galil_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

# Require C++ 2011 standard compatibility
USR_CXXFLAGS_Linux += -std=c++11

# For sCalcPostfix.h
USR_INCLUDES += -I$(CALC)/calcApp/src

