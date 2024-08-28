^!s:: ; Ctrl + Alt + S
    Run, typora.exe "C:\Users\emir_\Documents\Scrum.md"
return


^!t:: ; Ctrl + Alt + T
    Run "wt.exe"
    Sleep, 500
    Send, {Ctrl down}l{Ctrl up} ; Send Ctrl + L to clear the screen
return


^PgDn::  ; Ctrl + PgDn
    WinGet, active_id, ID, A
    WinClose, ahk_id %active_id%
return
