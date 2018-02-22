global delay := 1000 / 60 * 1.4

dash(dir) {
    Send {%dir% down}
    Sleep % delay
    Send {%dir% up}
    Sleep % delay
    Send {%dir% down}
    Sleep % delay
    Send {%dir% up}
}

fadc(dir) {
    Send {e down}{%dir% down}
    Sleep % delay
    Send {%dir% up}
    Sleep % delay
    Send {%dir% down}
    Sleep % delay
    Send {%dir% up}{e up}
    Sleep % delay
}

double_quarter(a, dir) {
    Send {Down down}
    Sleep % delay
    Send {%dir% Down}
    Sleep % delay
    Send {%dir% Up}
    Sleep % delay
    Send {%dir% Down}
    Sleep % delay
    Send {Down up}
    Sleep % delay
    Send {%dir% Up}{%a% down}
    Sleep % delay
    Send {%a% up}
}

circle() {
    ; Send {Left down}
    ; Sleep % delay
    ; Send {Left up}
    ; Sleep % delay
    ; Send {Down down}
    ; Sleep % delay
    ; Send {Down up}
    ; Sleep % delay
    ; Send {Right down}
    ; Sleep % delay
    ; Send {Right up}
    ; Sleep % delay
    ; Send {Up down}
    ; Sleep % delay
    ; Send {Up up}
    ; Sleep % delay

    Send {Left down}
    Sleep % delay
    Send {Left up}{Down down}
    Sleep % delay
    Send {Down up}{Right down}
    Sleep % delay
    Send {Right up}{Up down}
    Sleep % delay
    Send {Up up}
    Sleep % delay
}

normals(a, recovery) {
    Send {%a% down}
    Sleep % delay
    Send {%a% up}
    Sleep % recovery
}

hadoken(a, dir) {
    Send {Down down}
    Sleep % delay
    Send {%dir% down}
    Sleep % delay
    Send {Down up}
    Sleep % delay
    Send {%dir% up}
    Sleep % delay
    Send {%a% down}
    Sleep % delay
    Send {%a% up}
}

global spam_on := False
spam() {
    SetTimer, send_button, % (spam_on := !spam_on) ? 60 : "Off"
    return

    send_button:
    Send {d down}
    Sleep % delay
    Send {d up}
    return
}

; -::
; eryu_t24()
; return

; y::
; spam()
; return



; 7::
; circle()
; normals("f", 0)
; return

; 8::
; circle()
; ; normals("s", 0)
; return

; 9::
; Send {Left down}
; Sleep % delay
; Send {Left up}{Down down}
; Sleep % delay
; Send {Down up}{Right down}
; Sleep % delay
; Send {Right up}{Up down}
; Sleep % delay
; Send {Up up}{Left down}
; Sleep % delay
; Send {Left up}{Down down}
; Sleep % delay
; Send {Down up}{Right down}{s down}
; Sleep % delay
; Send {Right up}{s up}
; return

; 0::
; Send {Left down}
; Sleep % delay
; Send {Left up}{Down down}
; Sleep % delay
; Send {Down up}{Right down}
; Sleep % delay
; Send {Right up}{Up down}
; Sleep % delay
; Send {Up up}{Left down}
; Sleep % delay
; Send {Left up}{Down down}
; Sleep % delay
; Send {Down up}{Right down}{a down}
; Sleep % delay
; Send {Right up}{a up}
; return

