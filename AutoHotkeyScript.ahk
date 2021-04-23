#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Custom volume buttons
+NumpadAdd:: ; Shift + numpad plus
{
 Send {Volume_Up}
 Return
}
+NumpadSub:: ; Shift + numpad minus
{
 Send {Volume_Down}
 Return
}
break:: ; Break
{
 Send {Volume_Mute}
 Return
}

; Google/Youtube/ Search highlighted text
^+c::  ; Ctrl + Shift + c
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}
^+x::  ; Ctrl + Shift + x
{
 Send, ^c
 Sleep 50
 Run, https://www.youtube.com/results?search_query=%clipboard%
 Return
}

; Shortcut console / powershell
^#Enter:: ; Ctrl + Win + Enter
{
 EnvGet, SystemRoot, SystemRoot
 ;Run %SystemRoot%\system32\cmd.exe -ExecutionPolicy unrestricted,
 Run *RunAs %SystemRoot%\system32\cmd.exe
 Return
}

#Enter:: ; Win + Enter
{
 EnvGet, SystemRoot, SystemRoot
 ;Run %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy unrestricted,
 Run *RunAs %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
 Return
}

; Suspend AutoHotKey
#ScrollLock:: ; Win + ScrollLock
{
 Suspend
 Return
}
