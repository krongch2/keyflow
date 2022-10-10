#Include sf/c_viper.ahk
#Include sf/ibuki.ahk
#Include sf/e_honda.ahk
#Include sf/blanka.ahk
#Include sf/balrog.ahk
#Include sf/abel.ahk
#Include sf/gen.ahk
#Include sf/yang.ahk

push(keys*){
    for index, key in keys
        Send {%key% down}
    Sleep 50
    for index, key in keys
        Send {%key% up}
    }

plink(keys*){
    for index, key in keys
        Send {%key% down}
        Sleep 18
    Sleep 50
    for index, key in keys
        Send {%key% up}
    }

qcf(wait:=50){
    Send {k down}
    Sleep %wait%
    Send {l down}
    Sleep %wait%
    Send {k up}
    Sleep %wait%
    Send {l up}
    Sleep %wait%
    }

qcb(){
    Send {k down}
    Sleep 50
    Send {j down}
    Sleep 50
    Send {k up}
    Sleep 50
    Send {j up}
    Sleep 50
    }

dash(key){
    Send {%key% down}
    Sleep 30
    Send {%key% up}
    Sleep 30
    Send {%key% down}
    Sleep 30
    Send {%key% up}
    }

fadc(key){
    Send {e down}
    Sleep 50
    dash(key)
    Sleep 50
    Send {e up}
    }

hcb(){
    Send {l down}{k down}
    Sleep 50
    Send {l up}
    Sleep 50
    Send {j down}
    Sleep 50
    Send {k up}
    Sleep 50
    Send {j up}
    }

hcf(){
    Send {j down}{k down}
    Sleep 50
    Send {j up}
    Sleep 50
    Send {l down}
    Sleep 50
    Send {k up}
    Sleep 50
    Send {l up}
    }

dpf(){
    Send {l down}
    Sleep 50
    Send {k down}
    Sleep 50
    Send {i down}
    Sleep 50
    Send {l up}{k up}{i up}
    }