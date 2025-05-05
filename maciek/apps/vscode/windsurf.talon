app: windsurf
-
# Commands for Windsurf
accept: user.windsurf_click_accept()
reject: user.windsurf_click_reject()
stop: user.windsurf_click_stop()


# {a lot of this code does not work, for example har explain is recognized a trot explain
chat|hat|henry explain:
    # user.vscode("aichat.show-ai-chat")
    key("cmd-l")
    sleep(400ms)
    insert("explain this")
    key("enter")
    
chat|hat|henry close:
    key("cmd-shift-alt-l")
    
cascade|henry|henri:
    key("cmd-l")
    # user.vscode("aichat.show-ai-chat")

key(cmd-i:passive):
    # key("cmd-i")
    sleep(100ms)
    key("f8")

# cascade|henry|henri line:
#     key("cmd-l")
#     sleep(400ms)
#     key("cmd-l")
#     # user.vscode("aichat.show-ai-chat")
