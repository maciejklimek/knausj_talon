from talon import ctrl, ui, Module, Context, actions, clip, app


ctx = Context()
mod = Module()

mod.apps.edge = "app.name: Microsoft Edge"
mod.apps.edge = "app.name: /Microsoft Edge/"
mod.apps.edge = """
os: windows
and app.name: Microsoft Edge
os: windows
and app.exe: msedge.exe
"""


ctx.matches = r"""
app: edge
"""


@ctx.action_class("user")
class user_actions:
    def tab_jump(number: int):
        if number < 9:
            if app.platform == "mac":
                actions.key("cmd-{}".format(number))
            else:
                actions.key("ctrl-{}".format(number))

    def tab_final():
        if app.platform == "mac":
            actions.key("cmd-9")
        else:
            actions.key("ctrl-9")


@ctx.action_class("browser")
class browser_actions:
    def go(url: str):
        actions.browser.focus_address()
        actions.sleep("50ms")
        actions.insert(url)
        actions.key("enter")
