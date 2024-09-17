Gui, Add, Text,, Discord Auto Advertisement by Neoon`n`nHotkeys: CTRL+J=start CTRL+U=stop`n`n
Gui, Add, Text,, Press "Start" to begin and "Stop" to exit the script.

Gui, Add, Button, x10 y100 gStartScript, Start

Gui, Add, Button, x+10 yp gStopScript, Stop

Gui, Add, Text, x10 y+30, Interval (ms)`n135000 = official server trading`n315000 = natro macro trading

Gui, Add, Edit, x10 y+10 vIntervalEdit, 135000 ; Default interval is 135000 milliseconds

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
        Send ^v
        Sleep 1000
        Send {Enter}
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
        Send ^v
        Sleep 1000
        Send {Enter}
    }
return

GuiClose:
    ExitApp
return

^j::
    Gui, Submit, NoHide
    Interval := IntervalEdit
    if (!isRunning) {
        isRunning := true
        Send ^v
        Sleep 1000
        Send {Enter}
        GuiControl,, StatusText, Status: Active
        SetTimer, SendKeys, %Interval%
    }
return

^u::
    if (isRunning) {
        isRunning := false
        GuiControl,, StatusText, Status: Waiting...
        SetTimer, SendKeys, Off
    }
return
