from talon import Module, Context, actions, app, scope

mod = Module()
ctx = Context()

# Debug print to verify module loading
print("Loading maybe_sleep.py module...")


should_wake_up = False
microphone_active = None

def on_ready():
    global microphone_active
    try:
        microphone_active = actions.sound.active_microphone()
        print(f"Active microphone: {microphone_active}")
    except Exception as e:
        app.notify(f"Failed to get active microphone: {e}")

app.register('ready', on_ready)

@mod.action_class
class Actions:
    def maybe_talon_sleep():
        """Make Talon sleep if it is in command mode."""
        global should_wake_up, microphone_active
        print("maybe_talon_sleep")
        # print(f"Current microphone: {microphone_active}")
        
        microphone_active = actions.sound.active_microphone()
        print(f"Setting microphone_active = {microphone_active}")

        try:
            if actions.speech.enabled():
                actions.speech.disable() 
                should_wake_up = True
                print("Talon is enabled. Will wake up after sleep.")
            else: 
                should_wake_up = False
                print("Talon is disabled. Will not wake up after sleep.")

            # if microphone_active is None:
                
            actions.sound.set_microphone("None")
        except Exception as e:
            app.notify(f"Error in maybe_talon_sleep: {e}")

    def maybe_talon_wake_up():
        """Make Talon wake up if it was in sleep mode."""
        global should_wake_up, microphone_active
        print("maybe_talon_wake_up")
        print(f"Current microphone: {microphone_active}")
        try:
            if should_wake_up:
                print("Waking up Talon")
                actions.speech.enable()
            else:
                print("Not waking up Talon.")

            # if microphone_active:
            actions.sound.set_microphone("Wireless GO II RX")
                # actions.sound.set_microphone(microphone_active)
        except Exception as e:
            app.notify(f"Error in maybe_talon_wake_up: {e}")