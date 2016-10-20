#!/bin/sh 
chmod +x st.cmd
procServ --allow -n "CPI-XRAY" -p pid.txt -L log.txt --logstamp -i ^D^C 2001 ../../bin/$EPICS_HOST_ARCH/cpi st.cmd
sleep 10
