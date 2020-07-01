@echo off
:: Printer Install Script 1.0
:: Art Eppley EUS Albany

:Start
cls
title Printer Install


echo 1. HP LaserJet M281
echo 2. HP LaserJet M1536 MFP
echo 3. HP LaserJet M225dn
echo 4. HP LaserJet M227FDW
echo 5. HP LaserJet M402dn
echo 6. HP LaserJet 8720
echo 7. HP LaserJet 8730
echo 8. HP LaserJet 8740
echo 9. HP LaserJet 9020
echo.

CHOICE /C 123456789 /M "Enter your choice:"

IF ERRORLEVEL 9 GOTO 9020
IF ERRORLEVEL 8 GOTO 8740
IF ERRORLEVEL 7 GOTO 8730
IF ERRORLEVEL 6 GOTO 8720
IF ERRORLEVEL 5 GOTO M281
IF ERRORLEVEL 4 GOTO M1536
IF ERRORLEVEL 3 GOTO M225
IF ERRORLEVEL 2 GOTO M227
IF ERRORLEVEL 1 GOTO M402


:9020
cls
title Install HP9020

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i \\eoeng\devices\Printer\HP OfficeJet Pro 9020\64bit \\%1\C$\zco\


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:8740
cls
title Install HP8740

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP OfficeJet Pro 8740\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:8730
cls
title Install HP8730

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP OfficeJet Pro 8730\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:8720
cls
title Install HP8720

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP OfficeJet Pro 8720\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:M281
cls
title Install HPM281

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP LaserJet M281\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:M1536
cls
title Install HPM1536

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP LaserJet M1536 MFP\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:M225
cls
title Install HPM225

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP LaserJet Pro M225dn MFD\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:M227
cls
title Install HPM227

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP Laserjet Pro M227FDW\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:M402
cls
title Install HPM402

echo Please make sure the Printer is connected via USB
pause

xcopy /s /i "\\eoeng\devices\Printer\HP LaserJet Pro M402dn\64bit" "\\%1\C$\zco\"


echo.
echo Installing
echo.

Start "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k  c:\ZCO\64Bit\Aetna_Install.cmd"

RD \\%1\C$\zco\64bit /s /q
echo.
echo Please Have the user reboot their laptop/desktop
pause
GOTO Exit

:Exit
exit
