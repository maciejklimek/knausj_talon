from talon import Module, actions

DEFAULT_MICROPHONE = "System Default"

mod = Module()
 
@mod.action_class
class Actions:
    def talon_sleep_toggle():
        """Toggle Talon's sleep state and manage microphone settings.
        If waking up and microphone is 'None', it will attempt to enable the microphone.
        Returns:
            bool: True if Talon is now awake, False if now sleeping
        """
        print("Toggling Talon's sleep state...")

        was_sleeping = not actions.speech.enabled()
        actions.speech.toggle()
        
        # If we were sleeping and now waking up, check the microphone
        if was_sleeping:
            print("Setting microphone")
            actions.user.sound_set_preferred_microphone()
        
        return actions.speech.enabled()

    def talon_sleep():
        """talon sleep"""
        actions.speech.disable()

    def talon_wake_up():
        """talon wakeup"""
        
        actions.speech.enable()
