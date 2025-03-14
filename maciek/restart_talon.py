from talon import Module, actions, app
import time

mod = Module()

@mod.action_class
class Actions:
    def restart_talon() -> None:
        """Restart Talon with proper cleanup and safety measures."""
        app.notify("Preparing to restart Talon...")
        
        # First disable speech to prevent any accidental commands during restart
        try:
            actions.speech.disable()
            time.sleep(0.5)  # Give time for speech to fully disable
        except Exception as e:
            app.notify(f"Warning: Could not disable speech: {e}")
        
        app.notify("Terminating Talon process...")
        # The command will be properly detached from Talon's process tree
        # Using explicit signal name for clarity
        actions.user.system_command_nb("pkill -TERM Talon") 