@echo off
setlocal

rem clear result variables
set _cmd_res=
set _params_res=

rem split input like 2 cd /d c:\windows to (2, cd /d c:\windows)
for /f "tokens=1,* delims= " %%a in ("%*") do (
  set _cmdcnt=%~1
  set _tail=%%b
)

set /a _paramPos=%_cmdcnt%+1

call :fn_split %_paramPos% %_tail%

endlocal & (
  set _cmd_res=%_command:"=%
  if not "%_paramList%" == "" (
    set "_params_res=%_paramList:"=%"
  ) else (
    set "_params_res=%_paramList%"
  )
  set _command=
  set _paramList=
)
goto :EOF

:fn_split
setlocal EnableDelayedExpansion

  rem get command part
  set _command=
  set count=2
  :forLoop
  for /f "tokens=%count% delims= " %%a in ("%*") do (
    if "!_command!" == "" (set _command=%%a) else (set _command=!_command! %%a)
    set /a count+=1
    if !count! leq %~1 goto forLoop
  )

  rem params part
  for /f "tokens=%~1,* delims= " %%a in ("%*") do set _params=%%b

endlocal & (
  set _command=%_command%
  if not "%_params%" == "" (
    set "_paramList=%_params:)=^)%"
  ) else (
    set "_paramList=%_params%"
  )
)
goto :EOF

