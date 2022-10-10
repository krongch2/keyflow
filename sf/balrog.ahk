balrog_trial_22(){
    ; corner distance setup: point blank -> lp lp
    push("i", "l")
    Send {j down}{k down}
    Sleep 480
    push("s")
    Sleep 310
    push("f")
    Sleep 310
    push("f")
    Sleep 280
    Send {k up}
    push("f")
    Sleep 255
    push("k", "d")
    Sleep 100
    push("l", "s")
    Sleep 120
    push("l")
    Sleep 120
    push("s")
    Send {j up}
    }