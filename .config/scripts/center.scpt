tell application "System Events"
    set active_app to name of first application process whose frontmost is true
end tell

tell application "Finder"
    set screen_resolution to bounds of window of desktop
end tell

tell application "System Events" to tell application process active_app
    set old_position to position of window 1
    set old_size to size of window 1

    set w to item 1 of old_size
    set h to item 2 of old_size

    set screen_w to item 3 of screen_resolution
    set screen_h to item 4 of screen_resolution

    set position of window 1 to {(screen_w / 2) - (w / 2), (screen_h / 2) - (h / 2) + 10}
end tell
