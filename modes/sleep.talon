#defines the commands that sleep/wake Talon
mode: all
and not mode: user.deep_sleep
-
    
drowsy$: user.talon_sleep()

^deep sleep$:    
    speech.disable()
    mode.enable("user.deep_sleep")

^[<user.text>] scratch [that]$: 
    sleep(100ms)


    

