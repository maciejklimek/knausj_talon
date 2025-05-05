tell application "ProtonVPN"
	activate
	delay 2 -- czekaj aż aplikacja się załaduje
end tell

tell application "System Events"
	tell process "ProtonVPN"
		if exists (button "Disconnect" of window 1) then
			click button "Disconnect" of window 1
		else if exists (button "Quick Connect" of window 1) then
			click button "Quick Connect" of window 1
		end if
	end tell
end tell