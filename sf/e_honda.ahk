hands(wait, key_start, key_finish){
    Send {%key_start% down}
    Sleep %wait%
    Send {%key_start% up}{d down}
    Sleep %wait%
    Send {d up}{s down}
    Sleep %wait%
    Send {s up}{d down}
    Sleep %wait%
    Send {d up}{%key_finish% down}
    Sleep 50
    Send {%key_finish% up}
}

e_honda_trial_22(){
    Send {j down}{k down}
    Sleep 50
    Send {i down}{l down}
    Sleep 50
    Send {i up}{l up}
    Sleep 460
    push("d")
    Sleep 320
    push("c")
    Sleep 360
    hands(25, "f", "f")
    Sleep 50
    Send {l down}
    Sleep 50
    Send {l up}
    Sleep 50
    Send {l down}{k up}
    Sleep 50
    push("s")
    Send {l up}{j up}
    }

e_honda_trial_23(){
    Send {j down}{k down}
    hands(25, "f", "s")
    Send {j up}{k up}
    Sleep 1400
    push("z")
    }

e_honda_trial_24(){
    push("d")
    Send {j down}{k down}
    Sleep 700
    hands(25, "f", "s")
    Sleep 50
    Send {l down}
    Sleep 50
    Send {l up}
    Sleep 50
    Send {l down}{k up}
    Sleep 50
    push("s")
    Send {l up}{j up}
    }