#SingleInstance Force
SetWorkingDir %A_ScriptDir%
; SendMode Input

; #Include sf/sf.ahk

; SetTitleMatchMode, 2

#IfWinActive ahk_class CabinetWClass ; Windows Explorer
BackSpace::
    ControlGet renamestatus, Visible, , Edit1, A
    ControlGetFocus focussed, A
    if (renamestatus != 1 && (focussed = "DirectUIHWND3" || focussed = "SysTreeView321"))
        SendInput {Alt Down}{Up}{Alt Up}
    else
        Send {BackSpace}
    return


#IfWinActive ahk_class SSFIVAE ; Street Fighter IV
$LWin::return
; $RWin::return
8::up
9::Down
space::i
BackSpace::Space
Numpad9::o
Numpad7::u
CapsLock::return
; t::yang_trial_21()
return


#IfWinActive ahk_exe eldenring.exe
WheelUp::Return
WheelDown::Return
`;::
if (GetKeyState("LButton" , "P")=0)
    Click down
return
`; Up::Click up
,::LShift
; g::b

#IfWinActive ahk_class UnityWndClass ; Duel Links
; ~Space & j::MouseClick, left, 570, 540
; ~Space & l::MouseClick, left, 1350, 540
; k::MouseMove, 500, 0, 50, R
; k::MsgBox, "test"
; l::MouseMove, 500, 0, 100, R
; l::SendEvent {Click 100 200}
; l::SendEvent {Click 300, 0, 0, Relative}
$LWin::return
$LCtrl::return
F5::u
F6::
if (GetKeyState("LButton" , "P")=0)
    Click down right
return
F6 Up::Click up right
F7::o
F8::
if (GetKeyState("LButton" , "P")=0)
    Click down
return
F8 Up::Click up

Tab::
if (GetKeyState("LButton" , "P")=0)
    Click down
return
Tab Up::Click up

^i::Send {WheelUp 2}
^k::Send {WheelDown 2}
RShift::LShift
6::
    if (GetKeyState("LButton" , "P")=0)
        Send {Mbutton down}
    return
6 up::Send {Mbutton up}
^f::
Click, left, 1800, 230
Click, up
Sleep 300
Click, left, 900, 515
Click, up
return
^f up::Click up
; !j::MouseClick, left, 570, 540
; !l::MouseClick, left, 1350, 540
; Enter::
; Loop {
;     MouseClick, left, 960, 1020
;     if (GetKeyState("LButton", "P")=0)
;         break
;     sleep 10
; }
; return
`;::
if (GetKeyState("LButton" , "P")=0)
    Click down
return
`; Up::Click up

; a::
; if (GetKeyState("LButton" , "P")=0)
;     Click down
; return
; a Up::Click up
; =::Escape


#IfWinActive
; \::MouseMove, 500, 500, 100
; !l::SendEvent {RClick 1000 500 Down}{RClick 1500 500 Up}
; !l::MouseClickDrag, right, 1000, 500, 1500, 500
; l::SendEvent {Click 300, 0, 0, Relative}
; <!4::Enter
; <!2::Send {WheelUp 2}
; <!3::Send {WheelDown 2}
; <^8::Send {WheelUp 2}
; <^9::Send {WheelDown 2}
F3::
    if WinActive("ahk_class MainWindow") {  ; autoclick
        Loop {
            Click
            if (GetKeyState("LButton", "P")=0)
                break
            sleep 10
        }
    }
    else {
        if (GetKeyState("LButton" , "P")=0)
            Click down
        return
    }
F3 Up::Click up
$!F3::Send {Alt down}{LButton}{Alt up}
$^F3::
    if WinActive("ahk_class Chrome_WidgetWin_1") {
        Send {MButton}
        return
    }
    else {
        Send {Ctrl down}{LButton}{Ctrl up}
        return
    }
F4::Send {RButton}
+F10::Send {AppsKey}
^!a::
    ; exe_path := "C:\Program Files\Sublime Text 3\sublime_text.exe"
    exe_path := "C:\Program Files\Sublime Text\sublime_text.exe"
    file_path := "./keyflow.ahk"
    RunWait %exe_path% %file_path%
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
; <!n::Runwait, %comspec% /k "py -3 D:\vocab\wall.py && exit"
<!i::Send {Up}
<!k::Send {Down}
<!j::Send {Left}
<!l::Send {Right}
<!h::Send {Home}
<!;::Send {End}
<!u::Send {Ctrl down}{Left}{Ctrl up}
<!o::Send {Ctrl down}{Right}{Ctrl up}
; <!u::Send {Left 7}
; <!o::Send {Right 7}
<!y::Send {Up 7}
<!p::Send {Down 7}
<!8::Send {PgUp}
<!9::Send {PgDn}
<!<+i::Send {Shift down}{Up}{Shift up}
<!<+k::Send {Shift down}{Down}{Shift up}
<!<+j::Send {Shift down}{Left}{Shift up}
<!<+l::Send {Shift down}{Right}{Shift up}
<!<+h::Send {Shift down}{Home}{Shift up}
<!<+;::Send {Shift down}{End}{Shift up}
<!<+u::Send {Ctrl down}{Shift down}{left}{Ctrl up}{Shift up}
<!<+o::Send {Ctrl down}{Shift down}{right}{Ctrl up}{Shift up}
; <!<+u::Send {Shift down}{Left 7}{Shift up}
; <!<+o::Send {Shift down}{Right 7}{Shift up}
<!<+y::Send {Shift down}{Up 7}{Shift up}
<!<+p::Send {Shift down}{Down 7}{Shift up}
<!<+8::Send {Shift down}{PgUp}{Shift up}
<!<+9::Send {Shift down}{PgDn}{Shift up}
<^i::Send {Ctrl down}{Up}{Ctrl up}
<^j::Send {Ctrl down}{Left}{Ctrl up}
<^k::Send {Ctrl down}{Down}{Ctrl up}
<^l::Send {Ctrl down}{Right}{Ctrl up}
<^h::Send {Ctrl down}{Home}{Ctrl up}
<^;::Send {Ctrl down}{End}{Ctrl up}
; <^y::Send {Ctrl down}{Up 7}{Ctrl up}
; <^p::Send {Ctrl down}{Down 7}{Ctrl up}
<!-::
    IfWinActive ahk_class CabinetWClass
        Send {Ctrl down}{WheelDown}{Ctrl up}
    IfWinActive ahk_class MSPaintApp
        Send {Ctrl down}{PgDn}{Ctrl up}
    IfWinActive ahk_class wxWindowClassNR ; Audacity
        Send {Ctrl down}{3}{Ctrl up}
    else
        Send {Ctrl down}{NumpadSub}{Ctrl up}
    return
$<!=::
    IfWinActive ahk_class CabinetWClass
        Send {Ctrl down}{WheelUp}{Ctrl up}
    IfWinActive ahk_class OpusApp
        Send {Alt down}{=}{Alt up}
    IfWinActive ahk_class MSPaintApp
        Send {Ctrl down}{PgUp}{Ctrl up}
    IfWinActive ahk_class wxWindowClassNR ; Audacity
        Send {Ctrl down}{1}{Ctrl up}
    else
        Send {Ctrl down}{NumpadAdd}{Ctrl up}
    return
!<::Run % "nircmd.exe changebrightness -10"
!>::Run % "nircmd.exe changebrightness +10"
<!,::Send {Volume_down 1}
<!.::Send {Volume_up 1}
<!m::Send {Volume_mute}
<!BackSpace::Send {Delete}
<!a::Send {Ctrl down}{a}{Ctrl up}
<!s::Send {Ctrl down}{s}{Ctrl up}
<!z::Send {Ctrl down}{z}{Ctrl up}
<!w::Send {RWin down}{e}{RWin up}
<!e::ShiftAltTab
<!tab::AltTab

#i::#Up
#j::#Left
#l::#Right
#k::#d

^e::
    if WinActive("ahk_class PX_WINDOW_CLASS") or WinActive("ahk_class Chrome_WidgetWin_1") or WinActive("ahk_class Qt5QWindowIcon") {
        Send {Ctrl down}{Shift down}{Tab}{Shift up}{Ctrl up}
        return
    }
    else {
        return
    }

*capslock::return