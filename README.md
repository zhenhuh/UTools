# UTools
Thi is my personal utility tools library used in [Cmder](http://cmder.net/).  

My goal is to work in cmd easier and more smooth.  

## Prelude
Here is some preparations need to be done first.  
1. Add UTOOLS environment variable
2. Copy the code below to your Cmder init.bat file (find here *%ConEmuDir%\..\init.bat*), just replace the first line.
```
@echo off

:: Custom by Me
if not defined UTOOLS (
  echo UTOOLS variable not defined. Default set to c:\UTools
  set UTOOLS=%SYSTEMDRIVE%\UTools
)
if not exist %UTOOLS%\.meta (
  echo Not a valid UTools folder.
  echo You can git clone https://github.com/Demon-H/UTools.git to %UTOOLS%
)
:: Set my envrionment
call "%UTOOLS%\.meta\setenv.bat"
::End of custom
```

### Done:  
* shebang simulation on windows

* some very basic commands

### TodoList:  
* type url in cmd(e.g. u baidu.com) and will open that url in browser  

* copy the entity after copied that path (*Maybe workflow*)  

## Misc.  
Use .gitmessage file as commit template
> git config [--global] commit.template .gitmessage

Maybe a GUI editor is friendly
> git config [--global] core.editor c:\\Notepad++\\notepad++.exe

Setting from vender

> **histroy setting**: by default clink writes history only on exit, to change it: `clink set history_io 1` or modify `history_io` value in %ConEmuDir%\..\..\config\settings ([see here](https://github.com/mridgers/clink/issues/172))