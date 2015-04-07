#Include D:\Projects\KeyFlow\library.ahk
#InstallKeybdHook
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

NumpadAdd::
    Send {F4}
    Sleep 200
    Send {v}
    Sleep 200
    send {Enter}
    Sleep 200
    Send {Right}
    Sleep 200
    return
NumpadEnter::ControlClick, x920 y430, Guitar Rig 5 - Native Instruments

!v::Send {Ctrl down}{v}{Ctrl up}
TypingGame(){
    InputBox, UserInput, "Exercise Number", "Please enter an exercise number"
    Sleep 100
    if ErrorLevel {
        return
    }
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
$<!n::TypingGame()
$!F4::
    if WinActive("ahk_class Chrome_WidgetWin_1"){
        return
    }
    else {
        Send !{F4}
        return
    }
!F3::Send {MButton}
F3::
    if (not GetKeyState("LButton" , "P"))
        Click down
    return
F3 Up::Click up
^F3::Send {Ctrl down}{Click}{Ctrl up}
F4::Send {RButton}
F8::
    switch := !switch
    If (switch)
        usePlaybackDevice(1)
    else
        usePlaybackDevice(2)
    return

usePlaybackDevice(device) {
    Run, mmsys.cpl
    Sleep 100
    WinWaitActive, Sound ahk_class #32770
    Sleep 100
    ControlSend, SysListView321,{Down %device%}, Sound ahk_class #32770
    Sleep 100
    ControlClick, Button2, Sound ahk_class #32770
    Sleep 100
    WinClose, Sound ahk_class #32770
    Sleep 100
    TrayTip, , % if device = 1 ? "Scarlett 2i2" : "PC speakers"
}

ClickMiddleLeft(){
    CoordMode, Mouse, Screen
    MouseMove, (A_ScreenWidth // 4), (A_ScreenHeight // 2)
    Send {Click}
    return
}
ClickMiddleRight(){
    CoordMode, Mouse, Screen
    MouseMove, (A_ScreenWidth * 3 // 4), (A_ScreenHeight // 2)
    Send {Click}
    return
}

F1::
    if WinActive("ahk_class #32770"){
        ControlFocus, Edit1, A
        ; ControlGetText, strOldText, Edit1, A
        ControlSetText, Edit1, %clipboard%, A
        ControlSend, Edit1, {Enter}, A
        ; ControlSetText, Edit1, %strOldText%, A
        Sleep 200
        Send {Shift down}{Tab 2}{Shift up}
        return
    }
    if (WinActive("ahk_class CabinetWClass") or WinActive("ahk_class WorkerW") or WinActive("ahk_class Progman")){
        clipboard := Explorer_GetPath()
        return
    }
    else {
        msg := "Can't execute the command in this context. Force using the desktop location."
        MsgBox %msg%
        clipboard := "C:\Users\ccvector\Desktop"
        return
    }
<^u::ClickMiddleLeft()
<^o::ClickMiddleRight()
^!a::
    exe_path := "C:\Program Files (x86)\Sublime Text 2\sublime_text.exe"
    file_path := "D:\Projects\KeyFlow\keyflow.ahk"
    RunWait %exe_path% %file_path%
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
^!l::
    RunWait % "D:\Projects\life_archive\life.csv"
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
^!s::
    IfWinActive, stuff.txt - Notepad
        return
    else
    {
        IfWinExist, stuff.txt - Notepad
            WinActivate
        else
            Run % "C:\Users\ccvector\Desktop\stuff.txt"
            WinWait, stuff.txt - Notepad
            WinMaximize
    }
    return
^!v::
    RunWait % "D:\Projects\vocab.txt"
    WinActivate, ahk_class Notepad
    return
^!d::
    RunWait % "D:\Projects\debts.py"
    WinActivate, ahk_class PX_WINDOW_CLASS
    return
^!m::
    RunWait % "D:\Projects\Songs\Metronome.swf"
    WinActivate, ahk_class Chrome_WidgetWin_1
    return
^!u::
    Run % "D:\Projects\condensed_matter_research\software\Putty\PuTTY_Golub.lnk"
    return
    Sleep 1000
    WinActivate, ahk_class PuTTY
    Sleep 2000
    Send krongch2
    Sleep 200
    Send {Enter}
    Sleep 200
    Send Ifine2834{+}
    Sleep 200
    Send {Enter}
    Return
<+F10::Send {AppsKey}

char_command(char, times){
    if (char == "i"){
        command := "{Up " times "}"
    }
    else if (char == "k"){
        command := "{Down " times "}"
    }
    else if (char == "j"){
        command := "{Left " times "}"
    }
    else if (char == "l"){
        command := "{Right " times "}"
    }
    else if (char == "u"){
        command := "{Ctrl down}{Left " times "}{Ctrl up}"
    }
    else if (char == "o"){
        command := "{Ctrl down}{Right " times "}{Ctrl up}"
    }
    else {
        command := "{a 0}"
    }
    return command
}

+SC056::
    Input, times, I, abcdefghijklmnopqrstuvwxyz{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}
    StringRight, char, ErrorLevel, 1
    StringLower, low_char, char
    command := "{Shift down}" char_command(low_char, times) "{Shift up}"
    Send % command
    return

SC056::
    Input, times, I, abcdefghijklmnopqrstuvwxyz{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}
    StringRight, char, ErrorLevel, 1
    StringLower, low_char, char
    command := char_command(low_char, times)
    Send % command
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
<^8::Send {WheelUp 2}
<^9::Send {WheelDown 2}
<!-::
    IfWinActive ahk_class CabinetWClass
        Send {Ctrl down}{WheelDown}{Ctrl up}
    IfWinActive ahk_class MSPaintApp
        Send {Ctrl down}{PgDn}{Ctrl up}
    IfWinActive ahk_class wxWindowClassNR
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
    IfWinActive ahk_class wxWindowClassNR
        Send {Ctrl down}{1}{Ctrl up}
    else
        Send {Ctrl down}{NumpadAdd}{Ctrl up}
    return
!<::Run nircmd.exe changebrightness -10
!>::Run nircmd.exe changebrightness +10
<!,::Send {Volume_down 3}
<!.::Send {Volume_up 3}
<!m::Send {Volume_mute}
<!BackSpace::Send {Delete}
<!<+BackSpace::Send {Shift down}{Delete}{Shift up}
<!a::Send {Ctrl down}{a}{Ctrl up}
<!s::Send {Ctrl down}{s}{Ctrl up}
<!z::Send {Ctrl down}{z}{Ctrl up}
<!x::Send {Ctrl down}{x}{Ctrl up}
<!c::Send {Ctrl down}{c}{Ctrl up}
<!w::Send {RWin down}{e}{RWin up}
<!b::Send {Shift down}{F10}{Shift up}{b}{Enter} ; Open Cygwin Terminal
<!t::Send {Shift down}{F10}{Shift up}{w}{w}{Enter}{t} ; Create New Text Document
$<!d::
    if WinActive("ahk_class PuTTY"){
        Send cd /projects/wagner/highthroughput/working
        return
    }
    else {
        Send !d
        return
    }
$<!q::
    if WinActive("ahk_class PuTTY"){
        Send qstat -u krongch2 | less
        return
    }
    else {
        Send !q
        return
    }
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
>!i::Send {RWin down}{Up}{RWin up} ; Maximize
>!k::
    if WinActive("ahk_class WorkerW")
    {
        WinActivate, ahk_class WorkerW
        Sleep 100
        WinActivate, ahk_class Progman
    }
    else {
        Send {RWin down}{d}{RWin up}
        WinActivate, ahk_class WorkerW
        Sleep 100
        WinActivate, ahk_class Progman
    }
    return

>!j::Send {RWin down}{Left}{RWin up} ; To the Left
>!l::Send {RWin down}{Right}{RWin up} ; To the Right
^e::Send {Ctrl down}{Shift down}{Tab}{Shift up}{Ctrl up} ; Cycle Tabs Backward
$^g::
    if WinActive("ahk_class PX_WINDOW_CLASS"){
        Send ^g
        return
    }
    if WinActive("ahk_class Chrome_WidgetWin_1"){
        Sleep 100
        Send {Ctrl down}{c}{Ctrl up}
        Sleep 100
        Send {Ctrl down}{t}{v}{Ctrl up}{Enter}
        return
    }
    else {
        Send ^c
        Sleep 100
        Run, http://www.google.com/search?q=%clipboard%
        Return
    }

$<^y::
    Send ^c
    Sleep 100
    Run, https://www.youtube.com/results?search_query=%clipboard%
    Return

#IfWinActive ahk_class CabinetWClass
BackSpace::
    ControlGet renamestatus, Visible, , Edit1, A
    ControlGetFocus focussed, A
    if (renamestatus != 1 && (focussed = "DirectUIHWND3" || focussed = "SysTreeView321")){
        SendInput {Alt Down}{Up}{Alt Up}
        return
    }
    else {
        Send {BackSpace}
        return
    }

#IfWinActive ahk_class AcrobatSDIWindow
<^8::Send {Up 15}
<^9::Send {Down 15}


#IfWinActive ahk_class wxWindowClassNR
<!8::Send {PgDn}
<!9::Send {PgUp}
^!t::Send {F10}{c}{Down 6}{Enter}

#IfWinActive ahk_class TMainForm
-::Send {NumpadSub}
=::Send {NumpadAdd}
