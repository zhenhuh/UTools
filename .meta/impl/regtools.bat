@echo off

setlocal EnableDelayedExpansion

if not exist "%UTOOLS_CONFIG%" mkdir "%UTOOLS_CONFIG%"

rem scan scripts under %UTOOLS%, like *.pysh, *.hssh and so on
rem Notice: No conflict key name detect
set input=%1

if "%input%" == "1" (
  rm -f "%UTOOLS_CONFIG%\%TOOLS_ALIASES%"

  for /r "%UTOOLS%" %%I in ("*.*sh") do (
    echo %%~nI = %%~fI $* >> "%UTOOLS_CONFIG%\%TOOLS_ALIASES%"
  )
) else (
  rem SET /P disable the new line while echo, just a memo
  rem echo | set /p = "%input% = " > "%UTOOLS_CONFIG%\%TOOLS_ALIASES%" & dir %UTOOLS% /b /s | findstr /r "[\/|\\]%input%\..*sh" >> "%UTOOLS_CONFIG%\%TOOLS_ALIASES%"
  for /f %%I in ('dir "%UTOOLS%" /b /s ^| findstr /r "[\/^|\\]%input%\..*sh"') do (
    echo %input% = %%I $* >> "%UTOOLS_CONFIG%\%TOOLS_ALIASES%"
  )
)

rem update all keys
call "%_META%\make_alias.bat"

endlocal