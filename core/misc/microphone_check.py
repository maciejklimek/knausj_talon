from talon import app, actions, cron, Module

# NOTE: This script is a temporary debugging tool to check for situations
# where speech is enabled but the microphone is set to 'None'.
# It should likely be removed once the underlying issue is resolved.

mod = Module()

# Store the job handle so we can potentially stop it later if needed
microphone_check_job = None

def check_microphone_status():
    """Checks if speech is enabled but the microphone is 'None' and warns if so."""
    try:
        speech_enabled = actions.speech.enabled()
        # Use the specific check as the user described 'None'
        mic_name = actions.sound.active_microphone()

        if speech_enabled and mic_name == "None":
            # Make the warning noticeable
            app.notify(
                title="⚠️ Microphone Problem Detected",
                body="Speech is enabled, but the active microphone is 'None'.",
                subtitle="Talon may not hear you.",
            )
            print("WARNING: Speech enabled but microphone is 'None'.")

    except Exception as e:
        # Log errors if the actions fail for some reason
        print(f"Error during microphone check: {e}")

def start_microphone_check():
    """Starts the periodic microphone check."""
    global microphone_check_job
    if microphone_check_job is None:
        # Run every 5 seconds
        microphone_check_job = cron.interval("5s", check_microphone_status)
        print("Microphone status check started.")

def stop_microphone_check():
    """Stops the periodic microphone check."""
    global microphone_check_job
    if microphone_check_job:
        cron.cancel(microphone_check_job)
        microphone_check_job = None
        print("Microphone status check stopped.")

# Optional: Add Talon actions to manually start/stop the check if desired
@mod.action_class
class Actions:
    def microphone_check_start():
        """Manually start the microphone status check."""
        start_microphone_check()

    def microphone_check_stop():
        """Manually stop the microphone status check."""
        stop_microphone_check()

# Automatically start the check when Talon loads this file
app.register("ready", start_microphone_check)
# Optional: Stop the check when Talon exits (though often not strictly necessary)
# app.register("exit", stop_microphone_check)
