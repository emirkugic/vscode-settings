@echo off
REM pgrep.bat: Lists processes using PowerShell's Get-Process command.

powershell -Command "Get-Process | Format-Table -AutoSize"
