from talon import Context, actions, ui, Module, app

mod = Module()


@mod.action_class
class user_actions:
    def go_debug():
        """."""
        for app in ui.apps(background=False):
            print(app.name, app.exe)
