#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#InstallKeybdHook
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

flag = 0
SetCapsLockState, Alwaysoff
Gui, Add, Text,,欢迎使用键盘控制器v4.0。
Gui, Add, Text,,Caps（大写锁定键）+任意数字键/+号等于按下小键盘对应数字键/+号
Gui, Add, Text,,Caps+w/e/Ctrl/空格/左键/右键将连续按下w/e/Ctrl/空格/左键/右键
Gui, Add, Text,,Caps+f将每隔4秒按下一次左键
Gui, Add, Text,,Caps+p将循环产出化肥（需要人物坐在马桶上且食物度图标变灰）
Gui, Add, Text,,Delete（删除键）将停止上述连续按键。
Gui, Add, Text,,程序运行期间，Caps键暂时失去原功能。
Gui, Show, NoActivate, 键盘控制器v4

CapsLock & 0::
	Send {Numpad0 down}
	Send {Numpad0 up}
	return

CapsLock & 1::
	Send {Numpad1 down}
	Send {Numpad1 up}
	return

CapsLock & 2::
	Send {Numpad2 down}
	Send {Numpad2 up}
	return

CapsLock & 3::
	Send {Numpad3 down}
	Send {Numpad3 up}
	return

CapsLock & 4::
	Send {Numpad4 down}
	Send {Numpad4 up}
	return

CapsLock & 5::
	Send {Numpad5 down}
	Send {Numpad5 up}
	return

CapsLock & 6::
	Send {Numpad6 down}
	Send {Numpad6 up}
	return

CapsLock & 7::
	Send {Numpad7 down}
	Send {Numpad7 up}
	return

8::8
CapsLock & 8::
8 & CapsLock::
	Send {Numpad8 down}
	Send {Numpad8 up}
	return

CapsLock & 9::
	Send {Numpad9 down}
	Send {Numpad9 up}
	return

CapsLock & +::
	Send {NumpadAdd down}
	Send {NumpadAdd up}
	return

CapsLock & w::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Send {w down}
		Sleep 1000
		Send {w up}
		if (flag == 0) {
			break
		}
	}
	return

CapsLock & e::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Send {e down}
		Send {e up}
		Sleep 100
		if (flag == 0) {
			break
		}
	}
	return

CapsLock & Space::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Send {Space down}
		Sleep 100
		Send {Space up}
		if (flag == 0) {
			break
		}
	}
	return

CapsLock & Ctrl::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Send {Ctrl down}
		Sleep 100
		Send {Ctrl up}
		if (flag == 0) {
			break
		}
	}
	return

CapsLock & LButton::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Click Left
		Sleep 100
		if (flag == 0) {
			break
		}
	}
	return

CapsLock & RButton::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Click Right
		Sleep 100
		if (flag == 0) {
			break
		}
	}
	return

CapsLock & f::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Click Left
		Sleep 4000
		if (flag == 0) {
			break
		}
	}
	return

Del::
	if (flag != 0) {
		flag = 0
	}
	Send {Del down}
	Send {Del up}
	return

CapsLock & p::
	if (flag != 1) {
		flag = 1
	}
	Loop {
		Send {NumpadAdd}
		Sleep 500
		Send {f}
		Sleep 500
		width := A_ScreenWidth // 2
		height := A_ScreenHeight * 8 // 14
		click %width%, %height%
		Sleep 500
		Send {Escape}
		Sleep 500
		if (flag == 0) {
			break
		}
	}
	return

GuiEscape:
ButtonCancel:
GuiClose:
ExitApp
