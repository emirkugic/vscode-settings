@echo off
setlocal enabledelayedexpansion
set arg=%*
set isUrl=0

if "%arg%"=="" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe"
) else (
    rem Check if input is a URL
    echo %arg% | findstr /r /c:"^[a-zA-Z]*\:\/\/.*" > nul && set isUrl=1
    echo %arg% | findstr /r /c:"^www\..*\..*" > nul && set isUrl=1
    echo %arg% | findstr /r /c:".*\..*" > nul && set isUrl=1

    if !isUrl! equ 1 (
        rem Check if it starts with http or https, if not add http://
        echo %arg% | findstr /r /c:"^[a-zA-Z]*\:\/\/.*" > nul || set arg=http://%arg%
        start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" !arg!
    ) else (
        rem Replace spaces with plus for Google search
        set "searchQuery=%arg: =+%"
        start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://www.google.com/search?q=!searchQuery!"
    )
)

timeout /t 2 /nobreak >nul
cscript //nologo maximize.vbs
