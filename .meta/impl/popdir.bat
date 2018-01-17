@echo off
setlocal
set UTOOLS=%~dp0/../..

if not exist "%UTOOLS%/temp/.cd" goto :EOF
set /p _oldpath=<"%UTOOLS%/temp/.cd"
echo Poped "%_oldpath%"

rem after endlocal cd will be restored.
cd /d "%_oldpath%"
pushd .
rm -f "%UTOOLS%/temp/.cd"
endlocal
popd