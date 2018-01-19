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

rem find the newest version of vs
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
set _amd64flag=
if /i "%PROCESSOR_ARCHITEW6432%" == "amd64" set _amd64flag=1
if /i "%PROCESSOR_ARCHITECTURE%" == "amd64" set _amd64flag=1
if defined _amd64flag (
  set _vsVarsArg=AMD64
)

call "%_vs_path%VC\Auxiliary\Build\vcvarsall.bat" %_vsVarsArg% > nul

rem support input is sln or proj when only one *.sln or one *.(vcx|cs)proj in current folder
set _count=0
set _ifile=%~1
set _istype=
if /i "%_ifile%" == "sln" set _istype=1
if /i "%_ifile%" == "proj" set _istype=1
if defined _istype (
  for /f "delims=" %%i in ('dir /b *%_ifile% ^| findstr /r "\.*%_ifile%"') do (
    echo "%%i"
    set /a _count+=1
    set _ifile=%%i
  )
)

if "%_count%" gtr "1" (
  echo Too many results. Specify a file
  goto :EOF
)

set _file_specify=0
if "%_ifile%" == "" set _file_specify=0
if "%_count%" == "1" set _file_specify=1

if "%_file_specify%" == "1" (
  start /max devenv.exe "%_ifile%"
) else (
  start /max devenv.exe
)

goto :EOF
endlocal


:fn_or_condition
setlocal
  rem TODO maybe need to deal with input conditions
  goto :EOF
endlocal