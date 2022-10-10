
super_jump(){
    Send {k down}{l down}
    Sleep 50
    Send {i down}
    Sleep 50
    Send {i up}{k up}{l up}
    }

burn_kick(){
    Send {k down}
    Sleep 50
    Send {j down}
    Sleep 50
    Send {k up}
    Sleep 50
    Send {j up}{z down}
    Sleep 50
    Send {z up}
    }

cr_hp_seismic_cancel(){
    push("k", "s")
    qcb()
    push("d")
    Sleep 100
    push("s", "d")
    Sleep 17
    push("s", "d")

    Sleep 50
    }

cr_mp_u1(){
    Send {k down}{d down}
    Sleep 50
    Send {d up}{l down}
    Sleep 50
    Send {k up}{l up}
    Sleep 50
    Send {k down}
    Sleep 50
    Send {l down}
    Sleep 50
    Send {k up}
    Sleep 50
    Send {l up}{i down}
    Sleep 50
    Send {a down}{i up}
    Sleep 50
    Send {a up}
    }

cr_mp_u2(){
    Send {k down}
    Sleep 40
    Send {d down}{l down}
    Sleep 40
    Send {k up}{l up}{d up}
    Sleep 40
    Send {k down}
    Sleep 40
    Send {l down}{i down}
    Sleep 40
    Send {k up}{i up}
    Sleep 40
    Send {l up}
    Sleep 110
    Send {Lshift down}
    Sleep 20
    Send {Lshift up}
    Sleep 20
    Send {Lshift down}
    Sleep 50
    Send {Lshift up}
    }


c_viper_trial_22(){
    push("i", "l")
    Sleep 470
    push("z")
    Sleep 400
    push("c")
    Sleep 300
    push("f")
    Sleep 286
    cr_mp_u1()
    return
    }

c_viper_punish_combo_no_plink(){
    Send {s down}{k down}{l down}
    Sleep 50
    Send {s up}{l up}
    Sleep 50
    Send {l down}{a down}
    Sleep 50
    Send {a up}{l up}{k up}
    Sleep 400
    super_jump()
    Sleep 200
    burn_kick()
    Sleep 540
    qcf()
    qcf()
    push("a")
}

c_viper_punish_combo(){
    Send {k down}{l down}
    plink("s", "d", "f")
    Send {l up}
    Sleep 50
    Send {l down}{a down}
    Sleep 50
    Send {a up}{l up}{k up}
    Sleep 400
    super_jump()
    Sleep 200
    burn_kick()
    Sleep 540
    qcf()
    qcf()
    push("a")
}

c_viper_trial_24(){
    cr_hp_seismic_cancel()
    Sleep 20
    c_viper_punish_combo()
    return
}

c_viper_trial_23_ultra(){
    qcb()
    push("a")
    Sleep 1200
    push("k", "x")
    qcf()
    Sleep 50
    push("d")
    Sleep 400
    push("q")
    Sleep 500
    dash("j")
    Sleep 600
    cr_mp_u2()
    return
    }