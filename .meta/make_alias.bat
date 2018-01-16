@echo off
@doskey /macrofile="%_META%\aliases.cmd"
@if exist "%UTOOLS_CONFIG%\%TOOLS_ALIASES%" doskey /macrofile="%UTOOLS_CONFIG%\%TOOLS_ALIASES%"