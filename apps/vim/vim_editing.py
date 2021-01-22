from talon import Context, Module, actions, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
app: vim
not tag: user.vim_terminal
"""

@ctx.action_class("user")
class user_actions:
    def line_find_forward(key: str):
        actions.key("f")
        actions.key(key)

    def line_find_backward(key: str):
        actions.key("F")
        actions.key(key)

