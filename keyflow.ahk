#SingleInstance Force
; #InstallKeybdHook
; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.s
SetWorkingDir %A_ScriptDir%
SendMode Input
#Include sf.ahk
#Include trials.ahk

!Backspace::Send {Browser_Back}

<!4::Enter
<!2::Send {WheelUp 2}
<!3::Send {WheelDown 2}
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
; ^F3::
;     if WinActive("ahk_class Chrome_WidgetWin_1")
;         Send {MButton}
;     else
;         Send {Ctrl down}{LButton}{Ctrl up}
;     return
; ^F3::
;     if WinActive("ahk_class MainWindow") {  ; autoclick
;         Loop {
;             Send {MButton}
;             if (GetKeyState("LButton", "P")=0)
;                 break
;             sleep 10
;         }
;     }
;     else {
;         if (GetKeyState("LButton" , "P")=0)
;             Send {MButton down}
;         return
;     }
; ^F3 Up::Send {MButton up}
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

TypingGame(){
    InputBox, UserInput, "Exercise Number", "Please enter an exercise number"
    Sleep 100
    if ErrorLevel
        return
    else {
        if (UserInput = "a"){
            exe_path := "C:\Program Files (x86)\Sublime Text 2\sublime_text.exe"
            file_path := "D:\Projects\typing_game\ty.py"
            RunWait %exe_path% %file_path%
            WinActivate, ahk_class PX_WINDOW_CLASS
            return
        }
        path := "D:\Projects\typing_game\ex" UserInput ".txt"
        Runwait, "c:\cygwin64\bin\bash.exe" -c "cd /cygdrive/d/Projects/typing_game/; python ty.py %UserInput%"
        Sleep 100
        Loop {
            If FileExist(path) {
                MsgBox % "Ready!"
                break
            }
            else
                Sleep 100
                MsgBox % "The exercise does not exist. Try again."
                TypingGame()
                return
        }
        FileRead, Clipboard, %path%
        Sleep 100
        Run % "http://www.typing-lessons.org/exercise_6.html"
        Sleep 300
        WinActivate, ahk_class Chrome_WidgetWin_1
        return
    }
}
<!n::TypingGame()
^!a::
    exe_path := "C:\Program Files\Sublime Text 3\sublime_text.exe"
    file_path := "./keyflow.ahk"
    RunWait %exe_path% %file_path%
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
^!v::
    RunWait % "D:\Projects\vocab.txt"
    WinActivate, ahk_class Notepad
    return
^!d::
    RunWait % "D:\Projects\debts.py"
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
<!i::Send {Up}
<!k::Send {Down}
<!j::Send {Left}
<!l::Send {Right}
<!h::Send {Home}
<!;::Send {End}
<!u::Send {Ctrl down}{Left}{Ctrl up}
<!o::Send {Ctrl down}{Right}{Ctrl up}
<!y::Send {Up 10}
<!p::Send {Down 10}
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
<!<+y::Send {Shift down}{Up 10}{Shift up}
<!<+p::Send {Shift down}{Down 10}{Shift up}
<!<+8::Send {Shift down}{PgUp}{Shift up}
<!<+9::Send {Shift down}{PgDn}{Shift up}
<^i::
    if WinActive("ahk_class iTunes"){
        Send {Up}
        return
    }
    else {
        Send {Ctrl down}{Up}{Ctrl up}
        return
    }
<^j::Send {Ctrl down}{Left}{Ctrl up}
<^k::Send {Ctrl down}{Down}{Ctrl up}
<^l::Send {Ctrl down}{Right}{Ctrl up}
<^h::Send {Ctrl down}{Home}{Ctrl up}
<^;::Send {Ctrl down}{End}{Ctrl up}
<^y::Send {Ctrl down}{Up 10}{Ctrl up}
<^p::Send {Ctrl down}{Down 10}{Ctrl up}
<^8::Send {WheelUp 2}
<^9::Send {WheelDown 2}
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
; <!<+BackSpace::Send {Shift down}{Delete}{Shift up}
<!a::Send {Ctrl down}{a}{Ctrl up}
<!s::Send {Ctrl down}{s}{Ctrl up}
<!z::Send {Ctrl down}{z}{Ctrl up}
<!x::Send {Ctrl down}{x}{Ctrl up}
<!c::Send {Ctrl down}{c}{Ctrl up}
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
<![::Send {´}
<!]::
    clipboard := "~"
    if WinActive("ahk_class PuTTY")
        Send {Shift down}{Insert}{Shift up}
    else
        Send ^v
    return

#e::#Up

; Minimize
; #d::
;     if WinActive("ahk_class WorkerW")
;     {
;         WinActivate, ahk_class WorkerW
;         Sleep 100
;         WinActivate, ahk_class Progman
;     }
;     else {
;         Send {RWin down}{d}{RWin up}
;         WinActivate, ahk_class WorkerW
;         Sleep 100
;         WinActivate, ahk_class Progman
;     }
;     return

; To the Left
; #s::Send {RWin down}{Left}{RWin up}
#s::#Left

; To the Right
; #f::Send {RWin down}{Right}{RWin up}
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

u::Left
o::Right

#IfWinActive ahk_class SSFIVAE ; Street Fighter IV
i::Up
j::Left
k::Down
l::Right
space::Up
backspace::Space
g::c
b::r
; -::
; eryu_t24()
; return

; y::
; spam()
; return

7::
circle()
normals("f", 0)
return

8::
circle()
normals("s", 0)
return

9::
Send {Left down}
Sleep % delay
Send {Left up}{Down down}
Sleep % delay
Send {Down up}{Right down}
Sleep % delay
Send {Right up}{Up down}
Sleep % delay
Send {Up up}{Left down}
Sleep % delay
Send {Left up}{Down down}
Sleep % delay
Send {Down up}{Right down}{s down}
Sleep % delay
Send {Right up}{s up}
return

0::
Send {Left down}
Sleep % delay
Send {Left up}{Down down}
Sleep % delay
Send {Down up}{Right down}
Sleep % delay
Send {Right up}{Up down}
Sleep % delay
Send {Up up}{Left down}
Sleep % delay
Send {Left up}{Down down}
Sleep % delay
Send {Down up}{Right down}{a down}
Sleep % delay
Send {Right up}{a up}
return

