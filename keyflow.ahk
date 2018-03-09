#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SendMode Input
#Include sf.ahk
#Include trials.ahk

<!4::Enter
<!2::Send {WheelUp 2}
<!3::Send {WheelDown 2}
<^8::Send {WheelUp 2}
<^9::Send {WheelDown 2}
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
    exe_path := "C:\Program Files\Sublime Text 3\sublime_text.exe"
    file_path := "./keyflow.ahk"
    RunWait %exe_path% %file_path%
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
<!n::Runwait, %comspec% /k "py -3 D:\vocab\wall.py && exit"
<!i::Send {Up}
<!k::Send {Down}
<!j::Send {Left}
<!l::Send {Right}
<!h::Send {Home}
<!;::Send {End}
<!u::Send {Ctrl down}{Left}{Ctrl up}
<!o::Send {Ctrl down}{Right}{Ctrl up}
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
<^y::Send {Ctrl down}{Up 7}{Ctrl up}
<^p::Send {Ctrl down}{Down 7}{Ctrl up}
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
$^v::
    if WinActive("ahk_class PuTTY") or WinActive("ahk_class ConsoleWindowClass"){
        StringReplace clipboard2, clipboard, \r\n, \n, All
        SendInput {Raw}%clipboard2%
    }
    else
        Send ^v
    return
<![::
    clipboard := "``"
    if WinActive("ahk_class PuTTY")
        Send {Shift down}{Insert}{Shift up}
    if WinActive("ahk_class mintty")
        Send {Shift down}{Insert}{Shift up}
    else
        Send ^v
    return
<!]::
    clipboard := "~"
    if WinActive("ahk_class PuTTY")
        Send {Shift down}{Insert}{Shift up}
    if WinActive("ahk_class mintty")
        Send {Shift down}{Insert}{Shift up}
    else
        Send ^v
    return

#e::#Up
#s::#Left
#f::#Right

^e::Send {Ctrl down}{Shift down}{Tab}{Shift up}{Ctrl up}
^g::
    if WinActive("ahk_class PX_WINDOW_CLASS") {
        Send ^g
        return
    }
    if (WinActive("ahk_class Chrome_WidgetWin_1") || WinActive("ahk_class MozillaWindowClass")){
        Sleep 100
        Send {Ctrl down}{c}{Ctrl up}
        Sleep 100
        Send {Ctrl down}{t}{v}{Ctrl up}{Enter}
        return
    }
    if WinActive("ahk_class MediaPlayerClassicW") {
        Send ^g
        return
    }
    else {
        Send ^c
        Sleep 100
        Run % "http://www.google.com/search?q=%clipboard%"
        Return
    }

#IfWinActive ahk_class CabinetWClass ; Windows Explorer
BackSpace::
    ControlGet renamestatus, Visible, , Edit1, A
    ControlGetFocus focussed, A
    if (renamestatus != 1 && (focussed = "DirectUIHWND3" || focussed = "SysTreeView321"))
        SendInput {Alt Down}{Up}{Alt Up}
    else
        Send {BackSpace}
    return

#IfWinActive ahk_class wxWindowClassNR ; Audacity
!8::Send {PgDn}
!9::Send {PgUp}
^!t::Send {F10}{c}{Down 6}{Enter}

#IfWinActive ahk_class TMainForm ; Guitar Pro
-::Send {NumpadSub}
=::Send {NumpadAdd}
e::Send {Insert}
/::Send {NumpadDiv}
*::Send {NumpadMult}
+::Send {Shift down}{NumpadAdd}{Shift up}
_::Send {Shift down}{NumpadSub}{Shift up}
f::Send {Alt}{n}{c}{c}{c}{Enter}

#IfWinActive ahk_class EPSX
m::F1
.::F3

#IfWinActive ahk_class CastleWnd ; Castle Crashers
i::Up
j::Left
k::Down
l::Right

#IfWinActive ahk_class SSFIVAE ; Street Fighter IV
$LWin::return
i::Up
j::Left
k::Down
l::Right
space::Up
backspace::Space
