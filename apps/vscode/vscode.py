import json
from talon import Context, actions, ui, Module, app, clip

is_mac = app.platform == "mac"

ctx = Context()
mac_ctx = Context()
mod = Module()
mod.apps.vscode = """
os: mac
and app.bundle: com.microsoft.VSCode
"""
mod.apps.vscode = """
os: mac
and app.bundle: com.todesktop.230313mzl4w4u92
"""
mod.apps.vscode = """
os: linux
and app.name: Code
os: linux
and app.name: code-oss
"""
mod.apps.vscode = """
os: windows
and app.name: Visual Studio Code
os: windows
and app.exe: Code.exe
"""

ctx.matches = r"""
app: vscode
"""


ctx.settings["insert_wait"] = 5.0
user = actions.user
sleep = actions.sleep
key = actions.key
repeat = actions.repeat
insert = actions.insert
global_ctx = Context()
mod.list("vscode_projects", desc="VSCode projects")
mod.list("vscode_file_shortcuts", desc="VSCode file shortcuts")

vscode_projects = {
    # NOTE: this is here because of misrecognition.
    "crowns": "knausj_talon",
    "nous": "knausj_talon",
    "knaus": "knausj_talon",
    "fish": "fish-config",
    "auto": "autopilot",
    "helm": "autopilot-helm",
    "community": "community",
    "whisper": "talon-whisper",
}

global_ctx.lists["user.vscode_projects"] = vscode_projects.keys()


@mod.capture(rule="{user.vscode_projects}")
def vscode_project_names(m) -> str:
    return vscode_projects[m.vscode_projects]


@ctx.action_class("win")
class win_actions:
    def filename():
        title = actions.win.title()
        # this doesn't seem to be necessary on VSCode for Mac
        # if title == "":
        #    title = ui.active_window().doc

        if is_mac:
            result = title.split(" — ")[0]
        else:
            result = title.split(" - ")[0]

        if "." in result:
            return result

        return ""


@ctx.action_class("app")
class AppActions:
    # talon app actions
    def tab_open():
        actions.user.vscode("workbench.action.files.newUntitledFile")

    def tab_close():
        actions.user.vscode("workbench.action.closeActiveEditor")


@ctx.action_class("edit")
class edit_actions:
    def find(text=None):
        if is_mac:
            actions.key("cmd-f")
        else:
            actions.key("ctrl-f")
        if text is not None:
            actions.insert(text)

    def line_swap_up():
        actions.key("alt-up")

    def line_swap_down():
        actions.key("alt-down")

    def line_clone():
        actions.key("shift-alt-down")

    def jump_line(n: int):
        actions.user.vscode("workbench.action.gotoLine")
        actions.insert(str(n))
        actions.key("enter")
        actions.edit.line_start()


@mod.action_class
class Actions:
    def vscode_quick_open(text: str):
        """."""
        user.vscode("workbench.action.quickOpen")
        sleep("50ms")
        insert(text)
        sleep("100ms")
        key("enter")

    def command_copy_id():
        """Copy the command id of the focused menu item"""
        actions.key("tab:2 enter")
        actions.sleep("500ms")
        json_text = actions.edit.selected_text()
        command_id = json.loads(json_text)["command"]
        actions.app.tab_close()
        actions.clip.set_text(command_id)

    def vscode_limit_search(query: str):
        """Limit search"""
        user.vscode("workbench.action.findInFiles")
        sleep(0.1)
        key("tab")
        repeat(4)
        key("backspace")
        insert(query)
        key("enter")

    def vscode_terminal(number: int):
        """Activate a terminal by number"""
        actions.user.vscode(f"workbench.action.terminal.focusAtIndex{number}")

    #  to use it I have to call it  user.select_next_lines(number),
    #  why is it placed under user?
    def select_next_lines(nof_lines: int):
        """Docstring is required"""
        for i in range(nof_lines):
            actions.key("cmd-l")

    def vscode_open_project(project_name: str):
        """Open a project using project manager names.
        Please see '/Library/Application Support/Code/User/globalStorage/alefragnani.project-manager/projects.json \'
        for the list of project names.
        """
        # user.vscode("projectManager.listProjects")
        user.vscode("projectManager.listProjectsNewWindow")
        sleep(0.1)
        insert(project_name)
        key("enter")

    def command_palette():
        """Show command palette"""
        actions.key("ctrl-shift-p")


@ctx.action_class("user")
class user_actions:
    def command_palette():
        actions.key("cmd-shift-p")

    # XXX: no matching declarations error
    # snippet.py support beginHelp close
    # def snippet_search(text: str):
    #     actions.user.vscode("editor.action.insertSnippet")
    #     actions.insert(text)

    # XXX: no matching declarations error
    # def snippet_insert(text: str):
    #     """Inserts a snippet"""
    #     actions.user.vscode("editor.action.insertSnippet")
    #     actions.insert(text)
    #     actions.key("enter")

    # XXX: no matching declarations error
    # def snippet_create():
    #     """Triggers snippet creation"""
    #     actions.user.vscode("workbench.action.openSnippets")

    # snippet.py support end
    # XXX: no matching declarations error
    # def tab_next(number: int):
    #     print(number)
    #     for i in range(number):
    #         actions.user.vscode("workbench.action.nextEditorInGroup")

    # XXX: no matching declarations error
    # def tab_previous(number: int):
    #     for i in range(number):
    #         actions.user.vscode("workbench.action.previousEditorInGroup")

    def tab_jump(number: int):
        if number < 10:
            if is_mac:
                actions.key("cmd-{}".format(number))
            else:
                actions.key("alt-{}".format(number))

    def tab_final():
        if is_mac:
            actions.key("cmd-0")
        else:
            actions.key("alt-0")

    # splits.py support begin
    def split_number(index: int):
        """Navigates to a the specified split"""
        if index < 9:
            if is_mac:
                actions.key("cmd-{}".format(index))
            else:
                actions.key("ctrl-{}".format(index))

    # splits.py support end

    # find_and_replace.py support begin

    def find(text: str):
        """Triggers find in current editor"""
        if is_mac:
            actions.key("cmd-f")
        else:
            actions.key("ctrl-f")

        if text:
            actions.insert(text)

    def find_next():
        actions.user.vscode("editor.action.nextMatchFindAction")

    def find_previous():
        actions.user.vscode("editor.action.previousMatchFindAction")

    def find_everywhere(text: str):
        """Triggers find across project"""
        if is_mac:
            actions.key("cmd-shift-f")
        else:
            actions.key("ctrl-shift-f")

        if text:
            actions.insert(text)

    def find_toggle_match_by_case():
        """Toggles find match by case sensitivity"""
        if is_mac:
            actions.key("alt-cmd-c")
        else:
            actions.key("alt-c")

    def find_toggle_match_by_word():
        """Toggles find match by whole words"""
        if is_mac:
            actions.key("cmd-alt-w")
        else:
            actions.key("alt-w")

    def find_toggle_match_by_regex():
        """Toggles find match by regex"""
        if is_mac:
            actions.key("cmd-alt-r")
        else:
            actions.key("alt-r")

    def replace(text: str):
        """Search and replaces in the active editor"""
        if is_mac:
            actions.key("alt-cmd-f")
        else:
            actions.key("ctrl-h")

        if text:
            actions.insert(text)

    def replace_everywhere(text: str):
        """Search and replaces in the entire project"""
        if is_mac:
            actions.key("cmd-shift-h")
        else:
            actions.key("ctrl-shift-h")

        if text:
            actions.insert(text)

    def replace_confirm():
        """Confirm replace at current position"""
        if is_mac:
            actions.key("shift-cmd-1")
        else:
            actions.key("ctrl-shift-1")

    def replace_confirm_all():
        """Confirm replace all"""
        if is_mac:
            actions.key("cmd-enter")
        else:
            actions.key("ctrl-alt-enter")

    def select_previous_occurrence(text: str):
        actions.edit.find(text)
        actions.sleep("100ms")
        actions.key("shift-enter esc")

    def select_next_occurrence(text: str):
        actions.edit.find(text)
        actions.sleep("100ms")
        actions.key("esc")

    # def select_next_token():
    #     actions.edit.find("")
    #     actions.key("enter")
    #     actions.key("enter")
    #     actions.key("esc")

    # find_and_replace.py support end
