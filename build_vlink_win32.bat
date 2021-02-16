@echo off
if %1.==. goto usage
cls
echo This batch file must be used under "Developer Command Prompt for VS2019"
echo.
pause
echo.
nmake /F Makefile.Win32
echo .
echo Rename vlink executable with version number
ren vlink.exe vlink%1.exe
goto end

:usage
echo Needs a version number as a first parameter.
goto end

:end
echo on