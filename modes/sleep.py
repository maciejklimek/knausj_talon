from talon import Module, actions

mod = Module()
mod.mode("deep_sleep", desc="sleep mode, but deeper")

should_wake_up = False
@mod.action_class
class Actions:
    def talon_sleep_toggle():
        """test."""
        print("talon_sleep_toggle")
        actions.speech.toggle()
    
    def talon_sleep():
        '''talon sleep'''
        actions.speech.disable()
    
    def talon_wake_up():
        '''talon wakeup'''
        actions.speech.enable()
        
    def maybe_talon_sleep():
        '''Make Talon sleep if it is in command mode.'''
        global should_wake_up
        print("maybe_talon_sleep")
        if actions.speech.enabled():
            actions.speech.disable()
            should_wake_up = True
            print("Talon is enabled. Will wake up after sleep. ")
        else:
            should_wake_up = False
            print("Talon is disabled. Will not wake up after sleep. ")
        
    def maybe_talon_wake_up():
        '''Make Talon wake up if it was in sleep mode.'''
        global should_wake_up
        if should_wake_up:
            print("Waking up Talon")
            actions.speech.enable()
        else:
            print("Not waking up Talon.")
