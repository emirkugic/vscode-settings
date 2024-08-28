@echo off
setlocal enabledelayedexpansion

set "currentName=%~1"
set "newName=%~2"

if not exist "%currentName%" (
    echo File or directory "%currentName%" does not exist.
    exit /b 1
)

if exist "%newName%" (
    echo The target name "%newName%" already exists.
    exit /b 1
)

rename "%currentName%" "%newName%"

if %errorlevel% neq 0 (
    echo An error occurred while renaming "%currentName%" to "%newName%".
    exit /b 1
)

exit /b 0
