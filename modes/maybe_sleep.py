from talon import Module, actions

mod = Module()
mod.mode("maybe_sleep", desc="Only wake up if active before")

should_wake_up = False
microphone_active = actions.sound.active_microphone()
     

@mod.action_class
class Actions:
    def maybe_talon_sleep():
        """Make Talon sleep if it is in command mode."""
        global should_wake_up, microphone_active
        print("maybe_talon_sleep")
        if actions.speech.enabled():
            actions.speech.disable()
            should_wake_up = True
            print("Talon is enabled. Will wake up after sleep. ")
        else:
            should_wake_up = False
            print("Talon is disabled. Will not wake up after sleep. ")

        microphone_active = actions.sound.active_microphone()
        actions.sound.set_microphone("None")

    def maybe_talon_wake_up():
        """Make Talon wake up if it was in sleep mode."""
        global should_wake_up, microphone_active
        if should_wake_up:
            print("Waking up Talon")
            actions.speech.enable()
        else:
            print("Not waking up Talon.")
        actions.sound.set_microphone(microphone_active)