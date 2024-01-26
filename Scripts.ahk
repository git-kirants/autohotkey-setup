#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SendMode Input

; Elevate script to admin if not already running as admin
if not A_IsAdmin
    Run *RunAs "%A_ScriptFullPath%"

#o:: ; Win+O hotkey for Spotify
    Run, C:\Users\kiran\AppData\Roaming\Spotify\Spotify.exe
    return

^!d:: ; Ctrl+Alt+D for Downloads folder
    Run, C:\Users\kiran\Downloads
    return

^!b:: ; Ctrl+Alt+B for Brave Browser
    Run, "C:\Users\kiran\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe"
    return

^!p:: ; Ctrl+Alt+P for Flux
    Run, C:\Users\kiran\AppData\Local\FluxSoftware\Flux\flux.exe
    return

; Custom function to switch to Windows Terminal
SwitchToWindowsTerminal()
{
    windowHandleId := WinExist("ahk_exe WindowsTerminal.exe")
    windowExistsAlready := windowHandleId > 0

    if (windowExistsAlready = true)
    {
        activeWindowHandleId := WinExist("A")
        windowIsAlreadyActive := activeWindowHandleId == windowHandleId

        if (windowIsAlreadyActive)
            WinMinimize, "ahk_id %windowHandleId%"
        else
        {
            WinActivate, "ahk_id %windowHandleId%"
            WinShow, "ahk_id %windowHandleId%"
        }
    }
    else
        Run, wt
}

; Hotkey to use Ctrl+Shift+C to launch/restore the Windows Terminal.
^+c::SwitchToWindowsTerminal()

; Custom function to search on various platforms using Ctrl+CapsLock+Key
SearchOnPlatform(platformUrl)
{
    Send, ^c
    Sleep 50
    Run, %platformUrl%=%clipboard%
    Return
}

; Define hotkeys for searching on different platforms
Capslock & g::SearchOnPlatform("https://www.google.com/search?q")
Capslock & y::SearchOnPlatform("https://www.youtube.com/search?q")
Capslock & a::SearchOnPlatform("https://www.amazon.co.uk/s?k")
