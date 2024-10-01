app: vscode
-
# {a lot of this code does not work, for example har explain is recognized a trot explain
chat|hat|jackson explain:
    user.vscode("aichat.show-ai-chat")
    sleep(100ms)
    insert("explain this")
    key("enter")
    
chat|hat close:
    key("cmd-shift-alt-l")
    
chat|hat new:
    user.vscode("aichat.show-ai-chat")
