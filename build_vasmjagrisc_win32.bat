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
echo Generate the vasm jagrisc executables
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=std clean
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=std
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=madmac clean
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=madmac
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=mot clean
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=mot
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=oldstyle clean
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=oldstyle
echo.
echo Clean the vasm jagrisc objects
nmake /F Makefile.Win32 CPU=jagrisc SYNTAX=oldstyle clean
echo.
echo Rename vasmjagrisc* executables with version number
ren vasmjagrisc_*_win32.exe vasmjagrisc_*_win32_%1.exe
goto end

:usage
echo Needs a version number as a first parameter.
goto end

:end
echo on