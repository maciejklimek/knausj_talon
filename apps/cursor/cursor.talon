app: vscode
-
# {a lot of this code does not work, for example har explain is recognized a trot explain
chat|hat|jackson explain:
    # user.vscode("aichat.show-ai-chat")
    key("cmd-l")
    sleep(400ms)
    insert("explain this")
    key("enter")
    
chat|hat close:
    key("cmd-shift-alt-l")
    
chat|hat new:
    key("cmd-l")
    # user.vscode("aichat.show-ai-chat")
