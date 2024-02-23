from time import sleep
from talon import Context, actions, ui, Module, app

mod = Module()


is_tracking = False

# TODO(maciejk): DOES NOT WORK

def teleport_and_track_head():
    
    # global is_tracking
    # if not actions.tracking.control_enabled():
    #     actions.tracking.control_toggle(True)
    # actions.tracking.control_head_toggle(False)
    # actions.tracking.control_gaze_toggle(True)
    # actions.sleep("50ms")
    # actions.tracking.control_gaze_toggle(False)
    # actions.tracking.control_head_toggle(True)
    # is_tracking = True


@mod.action_class
class Actions:
    def teleport_and_track_head():
        """Teleport and track head"""
        teleport_and_track_head()
