#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

flag = 0
SetCapsLockState, Alwaysoff
Gui, Add, Text,,欢迎使用键盘控制器v3.0。
Gui, Add, Text,,Caps（大写锁定键）+任意数字键/+号等于按下小键盘对应数字键/+号
Gui, Add, Text,,Caps+w/e/左键/右键将连续按下w/e/左键/右键
Gui, Add, Text,,Caps+f将每隔4秒按下一次左键
Gui, Add, Text,,Delete（删除键）将停止上述连续按键。
Gui, Add, Text,,程序运行期间，Caps键暂时失去原功能。
Gui, Show, NoActivate, 键盘控制器v3

0::0
CapsLock & 0::
0 & CapsLock::
	Send {Numpad0 down}
	Send {Numpad0 up}
	return

1::1
CapsLock & 1::
1 & CapsLock::
	Send {Numpad1 down}
	Send {Numpad1 up}
	return

2::2
CapsLock & 2::
2 & CapsLock::
	Send {Numpad2 down}
	Send {Numpad2 up}
	return

3::3
CapsLock & 3::
3 & CapsLock::
	Send {Numpad3 down}
	Send {Numpad3 up}
	return

4::4
CapsLock & 4::
4 & CapsLock::
	Send {Numpad4 down}
	Send {Numpad4 up}
	return

5::5
CapsLock & 5::
5 & CapsLock::
	Send {Numpad5 down}
	Send {Numpad5 up}
	return

6::6
CapsLock & 6::
6 & CapsLock::
	Send {Numpad6 down}
	Send {Numpad6 up}
	return

7::7
CapsLock & 7::
7 & CapsLock::
	Send {Numpad7 down}
	Send {Numpad7 up}
	return

8::8
CapsLock & 8::
8 & CapsLock::
	Send {Numpad8 down}
	Send {Numpad8 up}
	return

9::9
CapsLock & 9::
9 & CapsLock::
	Send {Numpad9 down}
	Send {Numpad9 up}
	return

+::+
CapsLock & +::
+ & CapsLock::
	Send {NumpadAdd down}
	Send {NumpadAdd up}
	return
w::w
w & CapsLock::
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

e::e
CapsLock & e::
e & CapsLock::
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

LButton::LButton
CapsLock & LButton::
LButton & CapsLock::
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

RButton::RButton
CapsLock & RButton::
RButton & CapsLock::
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

f::f
CapsLock & f::
f & CapsLock::
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

GuiEscape:
ButtonCancel:
GuiClose:
ExitApp
