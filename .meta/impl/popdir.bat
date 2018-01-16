@echo off
setlocal
set UTOOLS=%~dp0/../..

if not exist "%UTOOLS%/temp/.cd" goto :EOF
set /p _oldpath=<"%UTOOLS%/temp/.cd"
chdir /d "%_oldpath%"
rm -f "%UTOOLS%/temp/.cd"
endlocal