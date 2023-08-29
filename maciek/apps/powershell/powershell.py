import json
from talon import Context, actions, ui, Module, app, clip

mod = Module()
mod.apps.powershell = """
os: windows
and app.name: WindowsTerminal.exe
os: windows
and app.exe: ubuntu.exe
"""
ctx = Context()
ctx.matches = r"""
app: powershell
"""

@ctx.action_class('app')
class AppActions:
    def tab_open():
        actions.key('ctrl-t')
    def tab_close():
        actions.key('ctrl-w')
    def tab_next():
        actions.key('alt-]')
    def tab_previous():
        actions.key('alt-[')
