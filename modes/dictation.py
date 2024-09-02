from talon import Module, actions

mod = Module()

dictation_mode_enabled = False

@mod.action_class
class Actions:
    def toggle_dictation_mode():
        """Toggles dictation mode on and off"""
        global dictation_mode_enabled
        if dictation_mode_enabled:
            print("Dictation mode enabled, disabling")
            actions.speech.disable()
            # actions.user.notify("Dictation mode disabled")
        else:
            print("Dictation mode disabled, enabling")
            actions.speech.enable()
            # actions.user.notify("Dictation mode enabled")
        
        dictation_mode_enabled = not dictation_mode_enabled