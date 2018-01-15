@echo off
rem shebang.bat - Unix shell behaviour from windows.
rem Use
rem     assoc .=shebangfile
rem     ftype shebangfile=shebang.bat "%1" %*
rem     set pathext=%pathext%;.
rem and put this somewhere in your path.
rem Author: Dion Nicolaas <dion@nicolaas.net>
rem http://whitescreen.nicolaas.net/programming/windows-shebangs
rem 

rem 
rem for me, I just want to distribute files according to their exts
rem but I also keep the original logic, so use shabang is also fine.
rem Modified by Demon Hua
rem

rem Get the script full path
set file=%~f1
rem Get the first line of the file
set /p line=<%1
rem Remove all quotes from the string, they shouldn't be there anyway
set line=%line:"=%
rem turn each part of the original space into a slash string
set line=%line: =/%
rem turn each part of the path into a quoted string, separated by spaces
set line="%line:/=" "%"
rem undef first everytime
set first=
rem set first to the first part ("{#}!"), not support command arguments now(e.g. perl -w)
rem {#} is the comment sign of each language
for %%i in (%line%) do call :fn_firstlast %%i

rem trim off space
set first=%first: =%

if not "%first:~-1%" == "!" (
  echo Not a valid executive script file. Add shebang to script or type file extension.
  goto :EOF
)

rem if it was a shebang line, set command accordingly, else use "type"
rem set command=type
rem if "%first:~-1%" == "!" set command=%last%
set command=%last%
rem Run command on the command line
%command% %*
goto :EOF

:fn_firstlast
rem Get first and last token, unquote in the process (which will also strip 
rem spaces). In Unix scripts 'perl -w' is much more likely than "the language
rem processor" (long file name with spaces)
  if not defined first (
    set first=%~1
  )
  set last=%~1
  goto :EOF
  
:fn_getext
setlocal
  set input=%1
  rem separate path from .
  for /d %%i in (%input:.= %) do (
    set _scriptext=%%i
  )
endlocal & set scriptext=%_scriptext%