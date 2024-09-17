mode: user.whisper
-
key(cmd-shift-f17):
    res = user.whisper_stop_dictation()
    insert(res)
    user.command_mode()
    
    
key(f5): 
    res = user.whisper_stop_dictation('en')
    insert(res)
    user.command_mode()

key(f4): 
    res = user.whisper_stop_dictation('pl')
    print(res)
    insert(res)
    user.command_mode()

key(f3): 
    res = user.whisper_stop_dictation()
    print(res)
    insert(res)
    user.command_mode()

