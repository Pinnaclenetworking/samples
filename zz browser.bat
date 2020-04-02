@echo off
:: use elevated credentials in a browser
:: Art Eppley EUS Albany

:Start
cls
title elevvated credentials


echo 1. ADHelp
echo 2. nettools
echo 3. Exit

CHOICE /C 123 /M "Enter your choice:"

IF ERRORLEVEL 3 GOTO Exit
IF ERRORLEVEL 2 GOTO nettools
IF ERRORLEVEL 1 GOTO ADHelp

:ADHelp
cls
title ADHelp

runas /user:aeth\zz287354 "C:\Program Files\Internet Explorer\iexplore.exe adhelp.aetna.com"

pause
GOTO Start

:nettools
cls
title nettools

runas /user:aeth\zz287354 "C:\Program Files\Internet Explorer\iexplore.exe nettools.aetna.com"

pause
GOTO Start

:RemoteGPUpdate
cls
title Force Group Policy Update

Set /p Computer Name=Enter Computer Name or I.P. Address:

echo.
echo Running gpupdate /force on %Computer Name%
echo.

psExec -s -i -d \\VHOL1617411 cmd /c "start /min gpupdate /force"

echo.
pause
GOTO Start

:Exit
exit