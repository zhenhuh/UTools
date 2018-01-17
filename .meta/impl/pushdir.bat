@echo off
setlocal EnableDelayedExpansion

set UTOOLS=%~dp0/../..
set cachefile=%UTOOLS%/temp/.cd
set print=%1

if "%print%" == "0" (
  if not exist "%cachefile%" (
    echo Nothing pushed
  ) else (
    set /p cached=<"%cachefile%"
    echo !cached!
  )
) else (
  echo | set /p = "%cd%" > "%cachefile%" & echo pushed "%cd%"
)

endlocal