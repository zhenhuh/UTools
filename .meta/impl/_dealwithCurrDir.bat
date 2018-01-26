@echo off
setlocal

rem split command and params
call "%_META_IMPL%\_splitCmdParams.bat" %*

rem get command part
set _command=%_cmd_res%

rem get all parts of params(input path, maybe space in it)
set _currdir=%_params_res%
if "%_currdir%" == "" set _currdir=.

rem remove quotes between the path if it has
set _currdir=%_currdir:"=%

rem replace / to \ for supporting path like c:\xxx\xxx\
set _currdir=%_currdir:/=\%

rem open parent folder if input is a file
if not exist "%_currdir%"\ (
  call :fn_doCommandInCurrDir "%_currdir%"
) else (
  call :fn_doCommand "%_currdir%"
)

endlocal
goto :EOF

:fn_doCommandInCurrDir
setlocal
  call :fn_doCommand "%~dp1"
  goto :EOF
endlocal

:fn_doCommand
setlocal
  echo %_command% "%~1"
  %_command% "%~1"
  if /i "%_command:~0,2%" == "cd" (
    pushd .
  )
  goto :EOF
endlocal