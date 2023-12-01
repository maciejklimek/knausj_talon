app: vscode
os: windows
-
deploy:
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    insert("task deploy-windows\n")
    sleep(50ms)
    key(left)