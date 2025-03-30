#RequireAdmin ; Required if your program interacts with applications that need elevated privileges.

Global $running = False ; Indicates whether the spam is active.
Global $tooltipActive = False ; Indicates whether the tooltip is active.
Global $targetWindow = "" ; Stores the handle of the target window.
Global $idleSleepTime = 1000 ; Pause duration when idle (in milliseconds).
Global $spamInterval = 100 ; Pause duration between each key press (in milliseconds).
Global $spamKey = "{ENTER}" ; Default key to spam

; Define hotkeys
HotKeySet("{F1}", "SetInterval") ; F1 to set the spam interval
HotKeySet("{F2}", "ChooseKey") ; F2 to choose a new key to spam
HotKeySet("{F3}", "ToggleSpam") ; F3 to start/stop the spam
HotKeySet("{F4}", "ExitScript") ; F4 to exit the script

While 1
    If $running Then
        ; Check if the active window is still the target window
        If WinGetHandle("[ACTIVE]") = $targetWindow Then
            Send($spamKey) ; Sends the selected key
            Sleep($spamInterval) ; Pause between each spam
        Else
            ; If the active window changes, stop the spam
            $running = False
            UpdateTooltip()
        EndIf
    Else
        Sleep($idleSleepTime) ; Use the defined idle sleep time
    EndIf
WEnd

; Function to start/stop the spam
Func ToggleSpam()
    If Not $running Then
        ; Get the handle of the currently active window
        $targetWindow = WinGetHandle("[ACTIVE]")
        If @error Then
            Tooltip("No active window detected", 0, 0)
            Sleep(2000)
            Tooltip("")
            Return
        EndIf
    EndIf

    $running = Not $running
    UpdateTooltip()
EndFunc

; Function to choose a new key
Func ChooseKey()
    $input = InputBox("Choose Key", "Enter the key to spam (e.g., {ENTER}, {SPACE}, a, b, c):", $spamKey, "", -1, -1, 0, 0)
    If @error Or $input = "" Then
        MsgBox(0, "Key Change Cancelled", "No key selected. Keeping the current key: " & $spamKey)
        Return
    EndIf
    $spamKey = $input
    MsgBox(0, "Key Changed", "The new key to spam is: " & $spamKey)
    UpdateTooltip()
EndFunc

; Function to set the spam interval
Func SetInterval()
    $input = InputBox("Set Interval", "Enter the interval (in milliseconds) between each key press:", $spamInterval, "", -1, -1, 0, 0)
    If @error Or $input = "" Then
        MsgBox(0, "Interval Change Cancelled", "No interval selected. Keeping the current interval: " & $spamInterval & "ms")
        Return
    EndIf
    If Not StringIsInt($input) Or $input < 10 Then
        MsgBox(16, "Invalid Input", "Please enter a valid integer greater than or equal to 10.")
        Return
    EndIf
    $spamInterval = Int($input)
    MsgBox(0, "Interval Changed", "The new interval between key presses is: " & $spamInterval & "ms")
    UpdateTooltip()
EndFunc

; Function to exit the script
Func ExitScript()
    Tooltip("") ; Removes the tooltip before exiting
    Exit
EndFunc

; Function to update the tooltip
Func UpdateTooltip()
    Local $winPos = WinGetPos($targetWindow) ; Gets the position of the target window
    If @error Then
        Tooltip("Unable to detect the target window", 0, 0)
        Return
    EndIf

    ; Tooltip position at the top-left corner of the target window
    Local $x = $winPos[0] ; X-coordinate of the window
    Local $y = $winPos[1] ; Y-coordinate of the window

    If $running Then
        Tooltip("Script running: Spamming " & $spamKey & " every " & $spamInterval & "ms (F1: Set Interval, F2: Change Key, F3: Stop, F4: Quit)", $x, $y)
        $tooltipActive = True
    ElseIf $tooltipActive Then
        Tooltip("Script paused (F1: Set Interval, F2: Change Key, F3: Resume, F4: Quit)", $x, $y)
    Else
        Tooltip("") ; Removes the tooltip if inactive
    EndIf
EndFunc
