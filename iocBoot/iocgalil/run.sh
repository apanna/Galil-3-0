#!/bin/sh 
chmod +x st.cmd
procServ --allow -n "GALIL-MOTOR" -p pid.txt -L log.txt --logstamp -i ^D^C 2009 ../../bin/$EPICS_HOST_ARCH/galil st.cmd
sleep 10
