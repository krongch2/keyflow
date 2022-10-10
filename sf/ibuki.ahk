ibuki_trial_21(){
    push("i", "l")
    Sleep 380
    push("s")
    Sleep 150
    push("l", "x")
    Sleep 420
    push("f")
    Sleep 120
    push("d")
    Sleep 120
    push("s")
    Sleep 50
    qcb()
    Sleep 50
    push("LShift")
    Sleep 1000
    hcb()
    Sleep 50
    push("f")
    return
    }

ibuki_trial_22(){
    push("k", "c")
    Sleep 301
    push("k", "f")
    Sleep 301
    push("f")
    Sleep 235
    plink("k", "d", "f")
    Sleep 50
    hcf()
    push("s")
    return
    }

ibuki_trial_23(){
    push("i", "l")
    Sleep 410
    push("c")
    Sleep 150
    push("l", "x")
    Sleep 400
    push("x")
    dpf()
    push("z")
    Sleep 200
    fadc("l")
    Sleep 50
    hcb()
    push("s")
    return
    }

stand_mk_u2(){
    push("x")
    Sleep 40
    Send {k down}
    Sleep 40
    Send {l down}
    Sleep 40
    Send {k up}{l up}
    Sleep 40
    Send {k down}
    Sleep 40
    Send {k up}{i down}{l down}
    Sleep 40
    Send {i up}
    ; Sleep 22
    ; Send {l up}{i down}
    ; Sleep 22
    push("LShift")
    Send {l up}
    return
    }

ibuki_trial_24(){
    push("k", "c")
    Sleep 301
    push("k", "f")
    Sleep 301
    push("c")
    Sleep 50
    stand_mk_u2()
    }