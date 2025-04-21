tell application "System Events"
    set activeApp to name of first application process whose frontmost is true
end tell

tell application "System Events" to tell application process activeApp
    set oldSize to size of window 1

    if oldSize is {1650, 1000} then
        set position of window 1 to {345, 235}
        set size of window 1 to {990, 600}
    else
        set position of window 1 to {15, 35}
        set size of window 1 to {1650, 1000}
    end if

end tell
