from talon import Context, actions

ctx = Context()
ctx.matches = r"""
os: mac
app: chrome
"""


@ctx.action_class("user")
class Actions:
    def go_back():
        actions.key("cmd-[")


@ctx.action_class("main")
class main_action:
    #  ideally I would like auto insert to be active only in the text fields
    def auto_insert(text):
        print(f"text =  {text}")
        actions.user.dictation_insert(text)

