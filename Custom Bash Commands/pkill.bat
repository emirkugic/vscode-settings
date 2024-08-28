@echo off
REM pkill.bat: Kills a process by its ID or name.

if "%~1"=="" (
    echo Usage: pkill [process_id|process_name]
    exit /b
)

REM Check if the input is a number (process ID).
echo %1 | findstr /r /c:"^[0-9]*$" >nul
if %errorlevel%==0 (
    REM Kill by process ID.
    taskkill /PID %1 /F
) else (
    REM Kill by process name.
    taskkill /IM %1 /F
)
