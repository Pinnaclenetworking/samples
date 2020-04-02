REM AVAYAONEX_Install.bat for AvayaOne-X v2-5-10 Install RTS Plugin

@echo off
color 0A
@echo %1 AVAYAONEX 2-5-10 Install for %2
@echo.
@echo User ID: %2

xcopy /s /i \\wseng\updates\Local\AVAYAONEX_Install \\%1\C$\zco\AVAYAONEX_Install

Start "AVAYAONEX 2-5-10 Install on %1 for %2" "C:\Program Files (x86)\rts\plugins\CMDPrompt\psexec.exe" \\%1 "cmd.exe" "/k powershell c:\ZCO\AVAYAONEX_Install\avayaonex_2-5-10_install.ps1"

RD \\%1\C$\zco\AVAYAONEX_Install /s /q


