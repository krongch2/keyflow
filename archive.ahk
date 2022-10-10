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

#IfWinActive ahk_class DEFAULT CLASS ; ff7
y::
Loop {
if (BreakLoop = 1)
    break
Send {c down}
Sleep 440
Send {c up}
Sleep 1500
}
BreakLoop := 0
return

,::
Loop {
if (BreakLoop2 = 1)
    break
Send {c down}
Sleep 100
Send {c up}
Sleep 220
Send {x down}
Sleep 100
Send {x up}
Sleep 220
}
BreakLoop2 := 0
return

.::
BreakLoop2 := 1
BreakLoop := 1
return

m::c
space::x
rshift::x
`;::x

#IfWinActive ahk_class CastleWnd ; Castle Crashers
i::Up
j::Left
k::Down
l::Right


^g::
    if WinActive("ahk_class PX_WINDOW_CLASS") or WinActive("ahk_class MediaPlayerClassicW"){
        Send ^g
        return
    }
    if WinActive("ahk_class Chrome_WidgetWin_1") or WinActive("ahk_class MozillaWindowClass"){
        Sleep 100
        Send {Ctrl down}{c}{Ctrl up}
        Sleep 100
        Send {Ctrl down}{t}{v}{Ctrl up}{Enter}
        return
    }
    else {
        Send ^c
        Sleep 100
        Run % "http://www.google.com/search?q=%clipboard%"
        Return
    }