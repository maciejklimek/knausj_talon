from talon import Context, Module, app

is_mac = app.platform == "mac"

ctx = Context()
mac_ctx = Context()
mod = Module()
mod.apps.windsurf = """
os: mac
and app.bundle: com.exafunction.windsurf
"""



