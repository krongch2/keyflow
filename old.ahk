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
