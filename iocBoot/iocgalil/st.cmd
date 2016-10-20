############################################################################
< envPaths

# For deviocstats
epicsEnvSet("ENGINEER", "Alireza Panna")
epicsEnvSet("LOCATION", "B1D521D DT-IMBLIN115")
epicsEnvSet("STARTUP","$(TOP)/iocBoot/$(IOC)")
epicsEnvSet("ST_CMD","st.cmd")

# Change this PV according to set-up
epicsEnvSet "P" "$(P=CEL:GALIL)"
epicsEnvSet "CONFIG" "$(CONFIG=motor)"
epicsEnvSet "EPICS_IOC_LOG_INET" "192.168.1.121"
epicsEnvSet "EPICS_IOC_LOG_PORT" "7004"
# uncomment to see every command sent to galil
#epicsEnvSet("GALIL_DEBUG_FILE", "galil_debug.txt")
############################################################################
# Increase size of buffer for error logging from default 1256
errlogInit(20000)
############################################################################
# Register all support components
cd ${TOP}
dbLoadDatabase("dbd/galilApp.dbd",0,0)
galilApp_registerRecordDeviceDriver(pdbbase)
############################################################################
# Load save_restore.cmd
cd $(IPL_SUPPORT)
< save_restore.cmd
set_requestfile_path("$(TOP)", "galilApp/Db")
############################################################################
cd $(STARTUP)
# Configure an example controller
< galil.cmd
# Start EPICS IOC
iocInit()
############################################################################
dbpf "CEL:GALIL:m1.CNEN", "1"
dbpf "CEL:GALIL:m2.CNEN", "1"
# Save motor positions every 5 seconds
#create_monitor_set("galilApp_positions.req", 5,"P=$(P):")
# Save motor settings every 30 seconds
#create_monitor_set("galilApp_settings.req", 30,"P1=$(P):, P2=RIO01:")
############################################################################
# Start EPICS IOC log server
iocLogInit()
setIocLogDisable(0)
############################################################################
# Turn on caPutLogging:
# Log values only on change to the iocLogServer:
caPutLogInit("$(EPICS_IOC_LOG_INET):$(EPICS_IOC_LOG_PORT)",1)
caPutLogShow(2)
############################################################################
# Write all PV names to local text file.
dbl > records.txt
############################################################################
# print the time our boot was finished
date
############################################################################