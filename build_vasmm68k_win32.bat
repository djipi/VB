@echo off
if %1.==. goto usage
cls
echo This batch file must be used under "Developer Command Prompt for VS2019"
echo.
pause
echo.
echo Create the obj directory
mkdir obj_win32
echo.
echo Generate the vasm m68k executables
nmake /F Makefile.Win32 CPU=m68k SYNTAX=std clean
nmake /F Makefile.Win32 CPU=m68k SYNTAX=std
nmake /F Makefile.Win32 CPU=m68k SYNTAX=madmac clean
nmake /F Makefile.Win32 CPU=m68k SYNTAX=madmac
nmake /F Makefile.Win32 CPU=m68k SYNTAX=mot clean
nmake /F Makefile.Win32 CPU=m68k SYNTAX=mot
nmake /F Makefile.Win32 CPU=m68k SYNTAX=oldstyle clean
nmake /F Makefile.Win32 CPU=m68k SYNTAX=oldstyle
echo.
echo Clean the vasm m68k objects
nmake /F Makefile.Win32 CPU=m68k SYNTAX=oldstyle clean
echo .
echo Rename vasmm68k* executables with version number
ren vasmm68k_*_win32.exe vasmm68k_*_win32_%1.exe
goto end

:usage
echo Needs a version number as a first parameter.
goto end

:end
echo on