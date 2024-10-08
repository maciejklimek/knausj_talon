from talon import ctrl, ui, Module, Context, actions, clip, app


ctx = Context()
mod = Module()

mod.apps.chrome = "app.name: Google Chrome"
mod.apps.chrome = """
os: windows
and app.name: Google Chrome
os: windows
and app.exe: chrome.exe
"""
mod.apps.chrome = """
os: mac
and app.bundle: com.google.Chrome
"""


# this is github, But I would rather use something that contains the name "GitHub" here, because
# this chrome identifier might change after I reinstall the app
mod.apps.chrome = """
os: mac
and app.bundle: com.google.Chrome.app.mjoklplbddabcmpepnokjaffbmgbkkgg
"""

# Slack
mod.apps.chrome = """
os: mac
and app.bundle: com.google.Chrome.app.hafhbkblfaoiokjmdkejebjfcikcjooa
"""

# click up
mod.apps.chrome = """
os: mac
and app.bundle: com.google.Chrome.app.edcmabgkbicempmpgmniellhbjopafjh
"""

ctx.matches = r"""
app: chrome
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
