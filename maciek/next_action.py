from time import sleep
from talon import Context, actions, ui, Module, app, speech_system

mod = Module()

next_talon_command = None


@mod.action_class
class Actions:
    def set_next_action(
        next_command: str = None,
    ):
        """Set next action"""
        global next_talon_command
        print("Next action set to: ", next_command)
        next_talon_command = next_command

    def execute_next_action():
        """Execute next action"""
        global next_talon_command
        if next_talon_command:
            speech_system.engine_mimic(next_talon_command)
