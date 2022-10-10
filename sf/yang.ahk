button_x_rekka(key, rekka_version){
    push(key)
    qcf(35)
    push("s")
    Sleep 270
    qcf(30)
    push("s")
    }

mk_jump_cancel_divekick(){
    push("x")
    Sleep 50
    push("i", "l")
    Sleep 310
    push("x", "k", "l")
    }

ultra_1(){
    qcf(30)
    qcf(30)
    push("a")
    }

yang_trial_21(){
    push("i", "l")
    Sleep 380
    push("x")
    Sleep 80
    push("k", "l", "x")
    Sleep 480
    button_x_rekka("d", "s")
    Sleep 100
    fadc("l")
    Sleep 210
    mk_jump_cancel_divekick()
    Sleep 90
    ultra_1()
    }