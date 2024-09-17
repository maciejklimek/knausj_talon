-- DOES NOT WORK
set appName to "Talon"
set bundleIdentifier to "com.talonvoice.Talon"

do shell script "pkill -f " & bundleIdentifier

delay 2


-- Uruchom ponownie aplikację
do shell script "open -b " & bundleIdentifier