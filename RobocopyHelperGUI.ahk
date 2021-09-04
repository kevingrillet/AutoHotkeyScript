#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Path := ""
Path := GetActiveExplorerPath()
if (Path = "") 
	ExitApp

RadioGroup := 1

Gui Font, s9, Segoe UI
Gui Add, Text, x8 y8 w50 h23 +0x200, Src
Gui Add, Text, x8 y40 w50 h23 +0x200, Dst
Gui Add, Edit, x64 y8 w345 h21 +ReadOnly, %Clipboard%
Gui Add, Edit, x64 y40 w345 h21 +ReadOnly, %Path%
Gui Add, Radio, x40 y72 w100 h21 gCheck vRadioGroup1 Checked, &MIR
Gui Add, Radio, x234 y72 w100 h21 gCheck vRadioGroup2, &Move
Gui Add, Button, gGuiOk x40 y104 w150 h23, &OK
Gui Add, Button, gGuiCancel x232 y104 w150 h23, &Cancel

Gui Show, w417 h135, RobocopyHelperGUI
Return

Check:
	Gui, Submit, NoHide
	if (RadioGroup1){
		RadioGroup := 1
	}
	if (RadioGroup2){
		RadioGroup := 2
	}
	Return

GuiOk:
	if (RadioGroup = 1) {
		Run, %comspec% /c Robocopy "%Clipboard%" "%Path%" /MIR /E /Z /R:5 /W:5 /TBD /V /MT:16 && pause
	}
	else {
		Run, %comspec% /c Robocopy "%Clipboard%" "%Path%" /Move /E /Z /R:5 /W:5 /TBD /V /MT:16 && pause
	}
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
