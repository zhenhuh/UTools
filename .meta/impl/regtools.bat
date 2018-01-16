@echo off

setlocal EnableDelayedExpansion

if not exist "%UTOOLS_CONFIG%" mkdir "%UTOOLS_CONFIG%"

rem scan scripts under %UTOOLS%, like *.pysh, *.hssh and so on
rem Notice: No conflict key name detect
set rewrite=%1

if "%rewrite%" == "1" (
  rm -f "%UTOOLS_CONFIG%\%TOOLS_ALIASES%"
)

for /r "%UTOOLS%" %%I in ("*.*sh") do (
  echo %%~nI = %%~fI >> "%UTOOLS_CONFIG%\%TOOLS_ALIASES%"
)

rem update all keys
call "%_META%\make_alias.bat"

endlocal