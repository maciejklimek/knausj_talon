from talon import Module, actions

mod = Module()
mod.mode("deep_sleep", desc="sleep mode, but deeper")

@mod.action_class
class Actions:
    def talon_sleep_toggle():
        """test."""
        actions.speech.toggle()
    
    def talon_sleep():
        '''talon sleep'''
        actions.speech.disable()
    
    def talon_wake_up():
        '''talon wakeup'''
        actions.speech.enable()