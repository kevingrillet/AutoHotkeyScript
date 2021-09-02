# AutoHotkeyScript

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?logo=gnu)](https://www.gnu.org/licenses/gpl-3.0)
[![Windows 10](https://img.shields.io/badge/Windows-10-blue?logo=windows)](https://www.microsoft.com/)
[![AutoHotkey v1.1.33.08](https://img.shields.io/badge/AutoHotkey-v1.1.33.08-green?logo=AutoHotkey)](https://www.autoitscript.com/site/)
[![Visual Studio Code](https://img.shields.io/badge/Editor-Visual%20Studio%20Code-blue?logo=visual-studio-code)](https://code.visualstudio.com/)

My AHK script used daily.

## Functionnalities

### AutoHotkeyScript.ahk

It's a script that adds useful functionality to my keyboard.

|Control|Action|Source|
|---|---|---|
|`Shift + Numpad plus`|:loudspeaker: Volume Up|[AHK Doc](https://www.autohotkey.com/docs/commands/SoundSet.htm#Remarks)|
|`Shift + Numpad minus`|:mega: Volume Down|[AHK Doc](https://www.autohotkey.com/docs/commands/SoundSet.htm#Remarks)|
|`Break` (Pause/Break)|:mute: Toogle Volume Mute|[AHK Doc](https://www.autohotkey.com/docs/commands/SoundSet.htm#Remarks)|
|`Ctrl + Shift + c`|:mag: Search highlighted text on Google|[AHK Forum](https://www.autohotkey.com/boards/viewtopic.php?t=55923)|
|`Ctrl + Shift + x`|:mag: Search highlighted text on YouTube|Edited from the previous|
|`Ctrl + Win + Enter`|:computer: Open Console [`cmd.exe`] as Administrator|[Reddit](https://www.reddit.com/r/AutoHotkey/comments/8s9pll/opening_cmdexe_with_administrator_privileges_win10/)|
|`Win + Enter`|:computer: Open PowerShell [`powershell.exe`] as Administrator|[Reddit](https://www.reddit.com/r/AutoHotkey/comments/8s9pll/opening_cmdexe_with_administrator_privileges_win10/)|
|`Win + ScrollLock`|:no_entry: Suspend AHK script|[AHK Doc](https://www.autohotkey.com/docs/commands/Suspend.htm)|
|`Ctrl + F2`|:open_file_folder: Call RobocopyHelperGUI.ahk||

### RobocopyHelperGUI.ahk

> Robocopy allows you to sync two directories. This means either ensuring all files in the destination directory are in the source directory and no more.

Using those options:

> `/MIR` will replicate data copying all files in the source not in the destination and delete files in the destination not in the source. **Beware!**
> `/W:0` Wait time between retries.
> `/R:0` Number of retries on failed copies.

Resulting in this command:

> `robocopy /MIR C:\src C:\dst  /W:0 /R:0`

- Src: location in clipboard
- Dst: current explorer location

Example:

- Ctrl + C the folder you want to copy
- Ctrl + F2 in the folder you want to move the content of the folder previously add to copy.
- A popup will show to help view what you are doing.
- OK will start the rebocopy.

## Install

### Requirements

- Install [AHK](https://www.autohotkey.com/download/)
- Done

### Usage

- Double-click on `AutoHotkeyScript.ahk`
- Done

### Add to startup

- Press `Win + R`, type `shell:startup`, then select `OK`. This opens the Startup folder
- Copy/Paste `AutoHotkeyScript.ahk` shortcut here
- Done
