from talon import Context, Module, actions, settings, ui

ctx = Context()


def populate_shell_tags(window):
    """TODO: Docstring for populate_shell_tags.
    :returns: TODO

    """
    shell_tags = {
        "zsh": "terminal",
        "gdb": "user.gdb",
    }
    if (window != ui.active_window() or 
        not window.title.startswith("VIM MODE:t") or 
        "TERM:" not in window.title):

        ctx.tags = []
        return

    index = window.title.find("TERM:")
    shell_command = window.title[index+len("TERM:"):]
    if ":" in shell_command:
        shell_command = shell_command.split(":")[0]

    if shell_command in shell_tags:
        ctx.tags = [shell_tags[shell_command]]
    else:
        ctx.tags = ["terminal"]
        print(f"WARNING: missing tag for shell cmd: {shell_command}")
        print(f"WARNING: consider updating vim_terminal.py: {shell_command}")


ui.register("win_title", populate_shell_tags)
