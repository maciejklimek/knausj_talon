app: vscode
-
deploy:
    user.vscode("workbench.action.terminal.focus")
    sleep(600ms)
    key("ctrl-c")
    insert("task deploy\n")