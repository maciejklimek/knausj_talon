from talon import Context, Module, app, actions, ui, cron
import os
from talon.experimental import locate

mod = Module()
mod.apps.windsurf = """
os: mac
and app.bundle: com.exafunction.windsurf
"""

@mod.action_class
class WindsurfActions:
    def windsurf_click_accept():
        """Click the Accept button in Windsurf"""
        resource_path = "/Users/maciek/projects/knausj_talon/resources/accept.png"
        print(f"Looking for Accept button using image: {resource_path}")
        
        try:
            matches = locate.locate(resource_path)
            print(f"Found {len(matches)} potential Accept button matches")
            
            if matches:
                # Get the center of the first match
                match = matches[0]
                x, y = match.x + match.width // 2, match.y + match.height // 2
                print(f"Accept button found at coordinates: ({x}, {y}), width: {match.width}, height: {match.height}")
                
                # Show visual feedback
                actions.user.show_cursor_helper(x, y)
                
                # Move mouse and click
                actions.mouse_move(x, y)
                print(f"Mouse moved to Accept button at ({x}, {y})")
                actions.mouse_click()
                print("Clicked on Accept button")
            else:
                print("Accept button not found on screen")
                actions.app.notify("Accept button not found on screen")
        except Exception as e:
            print(f"Error locating Accept button: {str(e)}")
            actions.app.notify(f"Error: {str(e)}")
        
    def windsurf_click_reject():
        """Click the Reject button in Windsurf"""
        resource_path = "/Users/maciek/projects/knausj_talon/resources/reject.png"
        print(f"Looking for Reject button using image: {resource_path}")
        
        try:
            matches = locate.locate(resource_path)
            print(f"Found {len(matches)} potential Reject button matches")
            
            if matches:
                # Get the center of the first match
                match = matches[0]
                x, y = match.x + match.width // 2, match.y + match.height // 2
                print(f"Reject button found at coordinates: ({x}, {y}), width: {match.width}, height: {match.height}")
                
                # Show visual feedback
                actions.user.show_cursor_helper(x, y)
                
                # Move mouse and click
                actions.mouse_move(x, y)
                print(f"Mouse moved to Reject button at ({x}, {y})")
                actions.mouse_click()
                print("Clicked on Reject button")
            else:
                print("Reject button not found on screen")
                actions.app.notify("Reject button not found on screen")
        except Exception as e:
            print(f"Error locating Reject button: {str(e)}")
            actions.app.notify(f"Error: {str(e)}")
        
    def windsurf_click_stop():
        """Click the Stop button in Windsurf"""
        resource_path = "/Users/maciek/projects/knausj_talon/resources/stop.png"
        print(f"Looking for Stop button using image: {resource_path}")
        
        try:
            matches = locate.locate(resource_path)
            print(f"Found {len(matches)} potential Stop button matches")
            
            if matches:
                # Get the center of the first match
                match = matches[0]
                x, y = match.x + match.width // 2, match.y + match.height // 2
                print(f"Stop button found at coordinates: ({x}, {y}), width: {match.width}, height: {match.height}")
                
                # Show visual feedback
                actions.user.show_cursor_helper(x, y)
                
                # Move mouse and click
                actions.mouse_move(x, y)
                print(f"Mouse moved to Stop button at ({x}, {y})")
                actions.mouse_click()
                print("Clicked on Stop button")
            else:
                print("Stop button not found on screen")
                actions.app.notify("Stop button not found on screen")
        except Exception as e:
            print(f"Error locating Stop button: {str(e)}")
            actions.app.notify(f"Error: {str(e)}")

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




