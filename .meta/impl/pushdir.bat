@echo off
setlocal

set UTOOLS=%~dp0/../..

echo %cd% > "%UTOOLS%/temp/.cd" & echo pushed %cd%

endlocal