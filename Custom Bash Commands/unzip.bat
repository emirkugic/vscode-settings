@echo off
setlocal enabledelayedexpansion

:: Check if the user provided an archive file as the first argument
if "%~1"=="" (
    echo Error: Please provide an archive file to extract.
    exit /b 1
)

:: Check if the user provided a folder name as the second argument
if "%~2"=="" (
    :: If no folder name provided, use the name of the archive file (without extension) as the folder name
    set "folder_name=%~n1"
) else (
    :: If a folder name is provided, use it (considering spaces in the folder name)
    set "folder_name=%~2"
)

:: Check if the folder already exists, and if not, create it
if not exist "!folder_name!" (
    mkdir "!folder_name!"
)

:: Use 7-Zip to extract the archive to the specified folder and suppress output
7z x "%~1" -o"!folder_name!" -y > nul

echo Extracted "%~1" to "!folder_name!"
