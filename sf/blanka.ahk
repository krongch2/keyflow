blanka_trial_24(){
    push("i", "l")
    Sleep 420
    push("z")
    Sleep 400
    Send {d down}
    Sleep 30
    Send {j down}{k down}{d up}
    Sleep 420
    push("x")
    Sleep 400
    Send {k up}{f down}
    Sleep 50
    Send {l down}{s down}{f up}
    Sleep 50
    Send {l up}{s up}{j up}
    }

cr_mk_ultra1(wait){
    Send {j down}{k down}
    Sleep %wait%
    push("x")
    Sleep 250
    Send {l down}
    Sleep 50
    Send {l up}
    Sleep 50
    Send {l down}{k up}
    Sleep 50
    Send {a down}{l up}
    Sleep 50
    Send {a up}{j up}

    }

blanka_trial_24_ultra(){
    push("i", "l")
    Send {j down}{k down}
    Sleep 420
    push("s")
    Sleep 400
    push("x")
    Sleep 382
    push("c")
    Sleep 265
    Send {k up}
    Sleep 50
    push("f")
    Sleep 50
    push("l", "d")
    Send {j up}
    Sleep 250
    push("q")
    Sleep 280
    dash("l")
    cr_mk_ultra1(1000)
    }