@echo off
setlocal enabledelayedexpansion

REM Check if no command is provided
if "%1"=="" (
    echo Please provide a command. Available commands: info, ls, delete
    goto :eof
)

REM Check the provided command
set "command=%1"
if /i "%command%"=="info" (
    REM Check if a WiFi name is provided with the info command
    if "%2"=="" (
        echo Please provide a WiFi name with the 'info' command.
        goto :eof
    )

    REM Use quotes around the entire WiFi name argument
    set "wifiName=%*"
    set "wifiName=!wifiName:*info=!"
    set "wifiName=!wifiName:~1!"
    netsh wlan show profile name="!wifiName!" key=clear
) else if /i "%command%"=="ls" (
    netsh wlan show profiles
) else if /i "%command%"=="delete" (
    REM Check if a WiFi name is provided with the delete command
    if "%2"=="" (
        echo Please provide a WiFi name with the 'delete' command.
        goto :eof
    )

    REM Use quotes around the entire WiFi name argument for delete
    set "wifiName=%*"
    set "wifiName=!wifiName:*delete=!"
    set "wifiName=!wifiName:~1!"
    netsh wlan delete profile name="!wifiName!"
) else (
    echo Unknown command. Available commands: info, ls, delete
)

:end
