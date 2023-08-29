os: windows
-
coder <user.vscode_project_names>:
    user.switcher_focus_and_wait("code", 0.5)
    sleep(100ms)
    user.vscode_open_project(vscode_project_names)