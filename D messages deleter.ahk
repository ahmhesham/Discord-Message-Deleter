#Requires AutoHotkey v2.0

toggle := false

; Only run hotkeys when Discord is active
#HotIf WinActive("ahk_exe Discord.exe")

; Ctrl + D starts the loop
^d:: {
    global toggle
    toggle := true
    TrayTip("Discord Macro", "Loop started!", 1)

    while toggle {
        ; Stop if Discord is not active
        if !WinActive("ahk_exe Discord.exe") {
            TrayTip("Discord Macro", "Loop stopped (Discord not active)!", 1)
            break
        }

        Send("{Space}")
        Sleep(100)
        Send("{BS}")
        Send("{Up}")
        Sleep(200)
        Send("^a")
        Sleep(100)
        Send("{BS}")
        Sleep(200)
        Send("{Enter}")
        Sleep(100)
        Send("{Enter}")
        Sleep(1000) ; fixed delay
    }

    TrayTip("Discord Macro", "Loop stopped!", 1)
}

; Ctrl + S stops the loop
^s:: {
    global toggle
    toggle := false
    TrayTip("Discord Macro", "Loop stopped!", 1)
}

; Emergency stop with Esc
Esc:: {
    global toggle
    toggle := false
    TrayTip("Discord Macro", "Emergency stop!", 1)
}

#HotIf
