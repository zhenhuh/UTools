@echo off
setlocal
rem get all parts of input path
set opendir=%*
if "%opendir%" == "" set opendir=.

rem remove quotes between the path if it has
set opendir=%opendir:"=%

rem replace / to \ for supporting path like c:\xxx\xxx\
set opendir=%opendir:/=\%

rem open parent folder if input is a file
if not exist "%opendir%"\ (
  call :fn_openParentDir "%opendir%"
) else (
  call :fn_open "%opendir%"
)

goto :EOF
endlocal

:fn_openParentDir
setlocal
  call :fn_open %~dp1
  goto :EOF
endlocal

:fn_open
setlocal
  echo Open "%~1"
  explorer "%~1"
  goto :EOF
endlocal