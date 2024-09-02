mode: user.whisper
-
key(cmd-shift-f17):
    res = user.whisper_stop_dictation()
    print("got")
    print(res)
    insert(res)
    user.command_mode()