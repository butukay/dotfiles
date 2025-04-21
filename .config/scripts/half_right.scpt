tell application "System Events"
    set activeApp to name of first application process whose frontmost is true
end tell

tell application "System Events" to tell application process activeApp
    set position of window 1 to {15+10+820, 35}
    set size of window 1 to {820, 1000}
end tell
