import json
import os

from talon import Context, Module, actions, app, ctrl, ui

mod = Module()

ctx = Context()
ctx.matches = r"""
app: stellaris
"""


@mod.capture
def stellaris_coordinates(m) -> list:
    "Return an stellaris_coordinates"


@ctx.capture(rule="{user.stellaris_coordinates}")
def stellaris_coordinates(m):
    return m.stellaris_coordinates


main_screen = ui.main_screen()


class Stellaris(object):

    """Managed database for tracking ts game screen coordinates"""

    def __init__(self):
        """Set up the coordinate database"""
        cwd = os.path.dirname(os.path.realpath(__file__))
        self.db = os.path.join(cwd, "screen_coordinates.json")


stellaris = Stellaris()


@mod.action_class
class Actions:
    def government():
        """Clicks on the government icon"""
        global stellaris
