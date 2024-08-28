Set objShell = CreateObject("WScript.Shell") 
Do Until objShell.AppActivate(" - Google Chrome")
    WScript.Sleep 100
Loop
objShell.SendKeys "% x"
