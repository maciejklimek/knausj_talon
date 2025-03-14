from talon import Module, actions, settings

mod = Module()
mod.list("playback_device", "Playback devices")
mod.list("microhpone_device", "Microphone devices")


@mod.action_class
class Actions:
    def volume_up():
        """Volume increase"""
        actions.key("volup")

    def volume_down():
        """Volume decrease"""
        actions.key("voldown")

    def change_sound_device(name: str):
        """Change sound device."""

    def sound_microphone_enabled() -> bool:
        """Returns true if the microphone is NOT set to 'None'"""
        return actions.sound.active_microphone() != "None"

    def sound_microphone_enable(enable: bool):
        """Enables or disables the microphone"""
        if enable:
            default_mic = actions.settings.get("user.default_microphone", "System Default")
            actions.sound.set_microphone(default_mic)
            actions.user.notify(f"Activating microphone: {default_mic}")
        else:
            actions.sound.set_microphone("None")
            actions.user.notify("Deactivating microphone")
        actions.user.sound_microphone_enable_event()

    def sound_microphone_toggle():
        """Toggle the microphone"""
        actions.user.sound_microphone_enable(
            not actions.user.sound_microphone_enabled()
        )

    def sound_microphone_enable_event():
        """Event that triggers when the microphone is enabled or disabled"""
        actions.skip()



