@echo off

setlocal EnableDelayedExpansion

rem visual studio is a 32-bit program, that's why reg:32 is needed for reg query. Hard code WOW6432Node into path is also OK, but ugly.
set _vs_registry_path=HKLM\SOFTWARE\Microsoft\VisualStudio\SxS\VS7

reg query %_vs_registry_path% /reg:32 > nul
if errorlevel 1 (
  echo VisualStudio is not installed.
  goto :EOF
)

set _last=0.0
set _vs_path=""

for /f "tokens=1,2,*" %%i in ('reg query %_vs_registry_path% /reg:32') do (
  if not "%%k" == "" (
  rem skip HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\SxS\VS7 line
    set _curr=%%i
    if !_curr! gtr !_last! (
      set _last=!_curr!
      set _vs_path=%%k
    )
  )
)

set _vsVarsArg=x86
if /i "%PROCESSOR_ARCHITEW6432%" == "amd64" or "%PROCESSOR_ARCHITECTURE%" == "amd64" (
  set _vsVarsArg=AMD64
)

call "%_vs_path%VC\Auxiliary\Build\vcvarsall.bat" %_vsVarsArg% > nul

start /max devenv.exe

endlocal