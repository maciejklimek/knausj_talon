tag: user.project_settings
-
# Commands to switch between projects
switch project <user.vscode_projects>:
    user.switch_project(vscode_projects)

reload project settings:
    user.reload_project_settings()

create templates for <user.vscode_projects>:
    user.create_project_templates(vscode_projects)
