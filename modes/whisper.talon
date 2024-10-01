mode: user.whisper
-
key(cmd-shift-f17):
    res = user.whisper_stop_dictation()
    insert(res)
    user.command_mode()
    
    
key(f4:up): 
    res = user.whisper_stop_dictation('en')
    print('Response')
    print(res)
    user.paste(res)
    user.command_mode()
 
key(f3:up):
    res = user.whisper_stop_dictation('pl')
    print('Response')
    user.paste(res)
    user.command_mode()

key(f5:up): 
    res = user.whisper_stop_dictation()
    print(res)
    user.paste(res)
    user.command_mode()
    

