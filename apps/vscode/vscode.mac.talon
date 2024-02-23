app: vscode
os: mac
-
deploy:
    user.vscode("workbench.action.terminal.focus")
    sleep(600ms)
    key("ctrl-c")
    insert("task deploy\n")

^deploy full:
    user.vscode("workbench.action.terminal.focus")
    sleep(600ms)
    key("ctrl-c")
    insert("task deploy\n")
    insert("task upload-cheatsheet\n")