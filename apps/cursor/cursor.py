import json
from talon import Context, actions, ui, Module, app, clip

is_mac = app.platform == "mac"

ctx = Context()
mac_ctx = Context()
mod = Module()
mod.apps.cursor = """
os: mac
and app.bundle: com.todesktop.230313mzl4w4u92
"""