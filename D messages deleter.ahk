; Only run hotkeys when Discord is active
#IfWinActive ahk_exe Discord.exe

toggle := false

; Ctrl+D starts the loop
^d::
toggle := true
TrayTip, Discord Macro, Loop started!, 1
while (toggle) {
    ; Stop if Discord is not active
    if !WinActive("ahk_exe Discord.exe") {
        TrayTip, Discord Macro, Loop stopped (Discord not active)!, 1
        break
    }

    send, {Space}
    sleep, 100
    send, {BS}
    send, {Up}
    sleep, 200
    send, ^a
    sleep, 100
    send, {BS}
    sleep, 200
    send, {Enter}
    sleep, 100
    send, {Enter}
    sleep, 1000   ; fixed delay
}
TrayTip, Discord Macro, Loop stopped!, 1
return

; Ctrl+S stops the loop
^s::
toggle := false
TrayTip, Discord Macro, Loop stopped!, 1
return

; Emergency stop with Esc
Esc::
toggle := false
TrayTip, Discord Macro, Emergency stop!, 1
return

#IfWinActive  ; End of Discord-only scope
