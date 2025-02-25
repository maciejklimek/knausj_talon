import json
import requests
from talon import Module, actions, settings, Context

# Import maybe_sleep module
from . import maybe_sleep

# Global variable to track flow state
_flow_active = False

mod = Module("user")
mod.tag('user', desc='User-specific actions')
mod.mode('flow', desc='Mode for handling flow-specific commands')

# Add setting for the flow shortcut
mod.setting(
    "flow_shortcut",
    type=str,
    default="ctrl-alt-b",
    desc="Shortcut key for activating flow mode",
)
mod.setting(
    "flow_shortcut_hands_free",
    type=str,
    default="cmd-shift-w",
    desc="Shortcut key for activating flow mode",
)
print("Settings registered: flow_shortcut, flow_shortcut_hands_free")

@mod.action_class
class Actions:
    
    def start_flow_continuous():
        """Start flow"""
        global _flow_active
        _flow_active = True
        actions.mode.enable('user.flow')
        print("Starting flow")
        shortcut = settings.get("user.flow_shortcut")
        print(f"Using shortcut: {shortcut}")
        actions.key(f"{shortcut}:down")
        _flow_active = True

    def toggle_flow():
        """Toggle flow on/off"""
        global _flow_active
        print(f"[FLOW TOGGLE] Current flow state: {'active' if _flow_active else 'inactive'}")

        if _flow_active:
            actions.mode.disable('user.flow')
            print("[FLOW TOGGLE] Deactivating flow...")
            shortcut = settings.get("user.flow_shortcut_hands_free")
            print(f"Using shortcut: {shortcut}")
            actions.key(f"{shortcut}")
            actions.user.maybe_talon_wake_up()
            print("[FLOW TOGGLE] Flow deactivated")
            _flow_active = False
        else:
            actions.mode.enable('user.flow')
            print("[FLOW TOGGLE] Activating flow...")
            actions.user.maybe_talon_sleep()
            shortcut = settings.get("user.flow_shortcut_hands_free")
            actions.key(f"{shortcut}")
            print("[FLOW TOGGLE] Flow activated")
            _flow_active = True 

    def stop_flow_continuous():
        """Stop flow"""
        global _flow_active
        print("Stopping flow")
        shortcut = settings.get("user.flow_shortcut")
        print(f"Using shortcut: {shortcut}")
        actions.key(f"{shortcut}:up")
        _flow_active = False
        actions.mode.disable('user.flow')
        
    def cancel_flow():
        """Cancel flow and restore previous Talon state"""
        global _flow_active
        print("Canceling flow")
        actions.user.maybe_talon_wake_up()
        _flow_active = False
        actions.mode.disable('user.flow')
