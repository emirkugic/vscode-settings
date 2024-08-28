@echo off
setlocal

if "%~1"=="" (
    echo Please provide a filename. Usage: mkf filename.txt
) else (
    copy nul "%~1" >nul 2>&1
)

endlocal
