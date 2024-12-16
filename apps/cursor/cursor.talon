app: vscode
-
# {a lot of this code does not work, for example har explain is recognized a trot explain
chat|hat|henry explain:
    # user.vscode("aichat.show-ai-chat")
    key("cmd-l")
    sleep(400ms)
    insert("explain this")
    key("enter")
    
chat|hat|henry close:
    key("cmd-shift-alt-l")
    
chat|hat|henry new:
    key("cmd-l")
    # user.vscode("aichat.show-ai-chat")
henry:
    key("cmd-l")
