@echo off
for /F "delims=" %%i in ('dir /b "%PUBLIC%\.."') do del /Q /F "%%USERPROFILE%\AppData\Local\Adobe\Acrobat\2015\IconacheRdr.dat"