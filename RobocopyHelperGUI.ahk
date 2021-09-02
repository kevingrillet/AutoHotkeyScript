#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Path := ""
Path := GetActiveExplorerPath()
if (Path = "") 
	ExitApp

Gui Font, s9, Segoe UI
Gui Add, Text, x8 y8 w50 h23 +0x200, Src
Gui Add, Text, x8 y40 w50 h23 +0x200, Dst
Gui Add, Edit, x64 y8 w345 h21 +ReadOnly, %Clipboard%
Gui Add, Edit, x64 y40 w345 h21 +ReadOnly, %Path%
Gui Add, Button, gGuiOk x40 y72 w150 h23, &OK
Gui Add, Button, gGuiCancel x232 y72 w150 h23, &Cancel

Gui Show, w417 h103, RobocopyHelperGUI
Return

GuiOk:
	Run, Robocopy /MIR "%Clipboard%" "%Path%" /W:0 /R:0
	ExitApp

GuiCancel:
GuiEscape:
GuiClose:
    ExitApp

;https://www.autohotkey.com/boards/viewtopic.php?f=6&t=69925
GetActiveExplorerPath()
{
	explorerHwnd := WinActive("ahk_class CabinetWClass")
	if (explorerHwnd)
	{
		for window in ComObjCreate("Shell.Application").Windows
		{
			if (window.hwnd==explorerHwnd)
			{
				return window.Document.Folder.Self.Path
			}
		}
	}
}