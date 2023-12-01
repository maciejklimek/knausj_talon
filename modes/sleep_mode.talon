mode: all
# and not mode: user.deep_sleep
-
settings():
    #stop continuous scroll/gaze scroll with a pop
    
	#enable pop click with 'control mouse' mode
    
    # Commented because of the WARNING
    # user.mouse_enable_pop_stops_scroll = 0
	# user.mouse_enable_pop_click = 0

^wake up [<phrase>]$: 
    user.talon_wake_up()
    user.rephrase(phrase or "")
