@echo off
SETCONSOLE /minimize
set "MISTERIP=192.168.1.100:8182"

rem Note: will likely be fat (for SD) or usb0 (for external/usb drive):
set "MISTERDRIVE=usb0"

rem Launches the OSD Menu to trigger the Autosave before launching another title.
curl --request POST --url "http://%MISTERIP%/api/controls/keyboard/osd"

rem Uncomment the rem in the next line to open the mister remote control website/app when launching.
rem start "" http://%MISTERIP%/control

rem Increase or decrease time (sec) for Autosave to complete.
timeout /t 5

rem For calling/launching the passed-in batch for a title.
"%~1"