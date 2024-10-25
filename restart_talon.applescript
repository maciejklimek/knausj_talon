tell application "Kitty" to quit

delay 1

do shell script "/Applications/kitty.app/Contents/MacOS/kitty --single-instance -d ~"

tell application "System Events"
    repeat until application process "kitty" exists
        delay 0.1
    end repeat
end tell

tell application "Kitty"
    activate
end tell

delay 1

tell application "System Events"
    tell process "kitty"
        -- Create a new tab for the Wispr Go project
        keystroke "t" using {command left}
        delay 0.5
        
        -- Navigate to the Wispr Go directory
        keystroke "cd /path/to/your/wispr/go/directory"
        key code 36 -- Press Enter
        delay 0.5
        
        -- Activate the virtual environment
        keystroke "source venv/bin/activate"
        key code 36 -- Press Enter
        delay 0.5
        
        -- Run the Python main script
        keystroke "python main.py"
        key code 36 -- Press Enter
    end tell
end tell