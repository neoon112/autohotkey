#SingleInstance, force
Gui, Add, Text,, Stump Snail Macro by Neoon`n`nHotkeys: CTRL+L=start CTRL+O=stop`n`n
Gui, Add, Text,, Press "Start" to begin and "Stop" to exit the script.

Gui, Add, Button, x10 y100 gStartScript, Start

Gui, Add, Button, x+10 yp gStopScript, Stop

Gui, Add, Text, x10 y+30, Interval (ms)`n60000 = 1m | 300000 = 5m

Gui, Add, Edit, x10 y+10 vIntervalEdit, 300000 ; Default interval is 300000 milliseconds

Gui, Add, Text, x10 y+10 vStatusText, Status: Waiting...

Gui, Show,, Script Control

isRunning := false

isRunning = false

StartScript:
    Gui, Submit, NoHide ; Retrieve the value from the input box
    Interval := IntervalEdit ; Assign the input value to the interval variable
    if (!isRunning) {
        isRunning := true
        GuiControl,, StatusText, Status: Active
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        Sleep 2000
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        Sleep 2000
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        SetTimer, SendKeys, %Interval%
    }
return

StopScript:
    if (isRunning) {
        isRunning := false
        GuiControl,, StatusText, Status: Waiting...
        SetTimer, SendKeys, Off
    }
return

SendKeys:
    if (isRunning) {
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        Sleep 2000
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        Sleep 2000
        Send {Space Down}
        Sleep 1
        Send {Space Up}
    }
return

GuiClose:
    ExitApp
return

^l:: ; CTRL+L to start
    Gui, Submit, NoHide ; Retrieve the value from the input box
    Interval := IntervalEdit ; Assign the input value to the interval variable
    if (!isRunning) {
        isRunning := true
        GuiControl,, StatusText, Status: Active
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        Sleep 2000
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        Sleep 2000
        Send {Space Down}
        Sleep 1
        Send {Space Up}
        SetTimer, SendKeys, %Interval%
    }
return

^o:: ; CTRL+O to exit
    if (isRunning) {
        isRunning := false
        GuiControl,, StatusText, Status: Waiting...
        SetTimer, SendKeys, Off
    }
return
