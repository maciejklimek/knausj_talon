mode: user.whisper
-
key(cmd-shift-f17):
    res = user.whisper_stop_dictation()
    insert(res)
    user.maybe_talon_wake_up()
    
    
key(f3:up):
    res = user.whisper_stop_dictation('pl')
    print('Response')
    print(res)
    user.paste(res)
    user.maybe_talon_wake_up()

key(f4:up): 
    res = user.whisper_stop_dictation('en')
    print('Response')
    print(res)
    user.paste(res)
    user.maybe_talon_wake_up()

key(f5:up): 
    res = user.whisper_stop_dictation()
    print('Response')
    print(res)
    user.paste(res)
    user.maybe_talon_wake_up()
    

