@echo off

rem run cd commnad between setlocal and endlocal is local impact!!!
call "%_META_IMPL%\_dealwithCurrDir.bat" 2 cd /d %*
rem use pushd and popd as a workaround
popd

