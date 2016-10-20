@echo off
rem suppress warnings about using windows style paths.
set CYGWIN=nodosfilewarning
rem In case epics is built dynamic (i.e. dlls present in bin)
if exist "dllPath.bat" (
	call dllPath.bat
)
if exist "C:\Epics\extensions\bin\%EPICS_HOST_ARCH%\procServ.exe" (
	procServ --allow -n "CPI-XRAY" -p pid.txt -L log.txt --logstamp -i ^D^C 2001 ..\..\bin\%EPICS_HOST_ARCH%\cpi.exe st.cmd
) else (
	..\..\bin\%EPICS_HOST_ARCH%\cpi.exe st.cmd
)
