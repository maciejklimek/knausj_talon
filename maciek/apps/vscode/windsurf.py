from talon import Context, Module, app, actions, ui, cron
import os
from talon.experimental import locate
from ...utils.image_click import click_image
from ...utils.path_utils import get_knausj_resource_path

mod = Module()
mod.apps.windsurf = """
os: mac
and app.bundle: com.exafunction.windsurf
"""

@mod.action_class
class WindsurfActions:
    def windsurf_click_accept():
        """Click the Accept button in Windsurf"""
        resource_path = get_knausj_resource_path("accept2.png")
        return click_image(resource_path, description="Accept button")

    def windsurf_click_reject():
        """Click the Reject button in Windsurf"""
        resource_path = get_knausj_resource_path("reject.png")
        return click_image(resource_path, description="Reject button")
        
    def windsurf_click_stop():
        """Click the Stop button in Windsurf"""
        resource_path = get_knausj_resource_path("stop.png")
        return click_image(resource_path, description="Stop button")

# Helper function to show a visual indicator at the cursor position
@mod.action_class
class HelperActions:
    def show_cursor_helper(x: int, y: int):
        """Show a visual indicator at the cursor position"""
        # This is a placeholder for any visual feedback you might want to add
        # You could implement this with a small overlay or other visual indicator
        print(f"Visual helper shown at ({x}, {y})")
        # This could be implemented with cron to show/hide an overlay
        # For now, we'll just log it




