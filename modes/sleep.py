from talon import Module, actions, settings
from .maybe_sleep import microphone_active

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
            default_mic = settings.get("user.default_microphone", "System Default")
            actions.sound.set_microphone(default_mic)
            # actions.user.notify(f"Activating microphone: {default_mic}")
            
            # if microphone_active:
            #     actions.sound.set_microphone(microphone_active)
            # else:
            #     print("No active microphone found. Using default.")
        
        return actions.speech.enabled()

    def talon_sleep():
        """talon sleep"""
        actions.speech.disable()

    def talon_wake_up():
        """talon wakeup"""
        
        actions.speech.enable()
