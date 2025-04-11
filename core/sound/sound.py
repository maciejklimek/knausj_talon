import subprocess
from talon import Module, actions, settings

DEFAULT_MICROPHONE = "System Default"

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
            default_mic = actions.settings.get("user.default_microphone", DEFAULT_MICROPHONE)
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

    def get_macos_current_microphone() -> str:
        """Gets the current microphone set in macOS using SwitchAudioSource"""
        try:
            # Assumes SwitchAudioSource is in the system PATH
            # -c gets current device, -t input specifies input device type
            result = subprocess.run(
                ["SwitchAudioSource", "-c", "-t", "input"],
                capture_output=True,
                text=True,
                check=True,  # Raise an exception if the command fails
            )
            mic_name = result.stdout.strip()
            print(f"macOS current microphone: {mic_name}")
            return mic_name
        except FileNotFoundError:
            print("Error: SwitchAudioSource command not found. Is it installed and in PATH?")
            actions.app.notify("Error: SwitchAudioSource not found", "Please install it (brew install switchaudio-osx)")
            return ""
        except subprocess.CalledProcessError as e:
            print(f"Error running SwitchAudioSource to get current mic: {e}")
            print(f"Stderr: {e.stderr}")
            actions.app.notify("Error getting microphone", f"SwitchAudioSource failed: {e.stderr.strip()}")
            return ""
        except Exception as e:
            print(f"Unexpected error getting current mic: {e}")
            actions.app.notify("Error getting microphone", "An unexpected error occurred.")
            return ""

    def set_macos_microphone(name: str):
        """Sets the macOS microphone using SwitchAudioSource"""
        if not name:
            print("Error: Cannot set macOS microphone to an empty name.")
            return
        try:
            # Assumes SwitchAudioSource is in the system PATH
            # -t input specifies input device type, -s sets the device by name
            subprocess.run(
                ["SwitchAudioSource", "-t", "input", "-s", name],
                capture_output=True,
                text=True,
                check=True,  # Raise an exception if the command fails
            )
            print(f"Successfully set macOS microphone to: {name}")
            # Optional: Notify the user
            actions.app.notify("macOS Microphone Set", f"Input set to: {name}")
        except FileNotFoundError:
            print("Error: SwitchAudioSource command not found. Is it installed and in PATH?")
            actions.app.notify("Error: SwitchAudioSource not found", "Please install it (brew install switchaudio-osx)")
        except subprocess.CalledProcessError as e:
            print(f"Error running SwitchAudioSource to set mic '{name}': {e}")
            print(f"Stderr: {e.stderr}")
            actions.app.notify("Error setting microphone", f"SwitchAudioSource failed: {e.stderr.strip()}")
        except Exception as e:
            print(f"Unexpected error setting mic '{name}': {e}")
            actions.app.notify("Error setting microphone", f"An unexpected error occurred trying to set to '{name}'.")

    def sound_set_preferred_microphone():
        """Sets the microphone to the first available preferred microphone based on the setting user.default_microphone"""
        preferred_mics_setting = settings.get("user.default_microphone", DEFAULT_MICROPHONE)
        preferred_mics = []
        mic_to_set = DEFAULT_MICROPHONE  # Default fallback

        if isinstance(preferred_mics_setting, str):
            preferred_mics = [mic.strip() for mic in preferred_mics_setting.split(',') if mic.strip()]
            if not preferred_mics:
                 print("Warning: user.default_microphone setting string was empty or only contained whitespace.")
            else:
                 print(f"Preferred microphones (from string): {preferred_mics}")
        # Keep old list support for backward compatibility or direct API usage?
        # elif isinstance(preferred_mics_setting, list):
        #     preferred_mics = preferred_mics_setting
        #     print(f"Preferred microphones (from list): {preferred_mics}")
        else:
            print(f"Warning: user.default_microphone setting is not a string ({type(preferred_mics_setting)}). Using fallback.")

        if preferred_mics:
            try:
                available_mics = actions.sound.microphones()
                print(f"Available microphones: {available_mics}")
                
                for mic in preferred_mics:
                    if mic in available_mics:
                        mic_to_set = mic
                        print(f"Found available preferred microphone: {mic_to_set}")
                        break # Found the first available preferred mic
                else:
                    print("No preferred microphones were available.")
            except Exception as e:
                print(f"Error getting available microphones: {e}. Using fallback.")
                # Keep mic_to_set as DEFAULT_MICROPHONE

        print(f"Setting microphone to: {mic_to_set}")
        actions.sound.set_microphone(mic_to_set)
