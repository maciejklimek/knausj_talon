#defines the commands that sleep/wake Talon
mode: all
and not mode: user.deep_sleep

-

# ^welcome back$:
#     user.mouse_wake()
#     user.history_enable()
#     user.talon_mode()
    


    
# ^deep sleep$:
#     user.switcher_hide_running()
#     user.history_disable()
#     user.homophones_hide()
#     user.help_hide()
#     user.mouse_sleep()
#     speech.disable()
#     user.engine_sleep()
    
drowsy$: user.talon_sleep()

^deep sleep$:    
    speech.disable()
    mode.enable("user.deep_sleep")

^[<user.text>] scratch [that]$: 
    sleep(100ms)


    

