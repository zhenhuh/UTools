@echo off

rem setlocal EnableDelayedExpansion
rem if errorlevel 1 (
rem    echo Unable to enable delay extensions
rem )

: trim trailing slash or backslash
if "%UTOOLS:~-1%" == "\" set UTOOLS=%UTOOLS:~0,-1%
if "%UTOOLS:~-1%" == "/" set UTOOLS=%UTOOLS:~0,-1%

: adding batch tools folder to PATH
set PATH=%UTOOLS%;%PATH%

set METADIR=%UTOOLS%\.meta

: simulate shebang
assoc .pysh=shebang
ftype shebang="%METADIR%\shebang.bat" "%%1" %%*
set PATHEXT=.pysh;%PATHEXT%

rem assoc .py=Python.ExecuteScript
rem ftype Python.ExecuteScript="%METADIR%\shebang.bat" "%%1" %%*
rem set PATHEXT=.py;%PATHEXT%

cls
