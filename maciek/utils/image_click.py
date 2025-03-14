from talon import actions, ui, app
from talon.experimental import locate
import os
import traceback

def click_image(image_path, description="image", show_helper=True, debug=True):
    """
    Locate an image on the screen and click on it.
    
    Args:
        image_path (str): Absolute path to the image file to locate
        description (str): Description of what the image represents (for logging)
        show_helper (bool): Whether to show visual helper at click location
        debug (bool): Whether to print detailed debug information
        
    Returns:
        bool: True if the image was found and clicked, False otherwise
    """
    if debug:
        print(f"[IMAGE_CLICK] Looking for {description} using image: {image_path}")
    
    # Verify image file exists
    if not os.path.exists(image_path):
        error_msg = f"ERROR: Image file does not exist: {image_path}"
        if debug:
            print(f"[IMAGE_CLICK] {error_msg}")
        actions.app.notify(error_msg)
        return False
    
    if debug:
        file_size = os.path.getsize(image_path)
        print(f"[IMAGE_CLICK] Image file exists: {image_path}")
        print(f"[IMAGE_CLICK] Image file size: {file_size} bytes")
        
        # Log active window information
        active_window = ui.active_window()
        print(f"[IMAGE_CLICK] Active window: {active_window.title} (app: {active_window.app.name})")
        print(f"[IMAGE_CLICK] Window dimensions: {active_window.rect}")
    
    try:
        if debug:
            print(f"[IMAGE_CLICK] Starting image search with locate.locate()")
        
        matches = locate.locate(image_path)
        
        if debug:
            print(f"[IMAGE_CLICK] Search completed. Found {len(matches)} potential {description} matches")
            
            if matches:
                print(f"[IMAGE_CLICK] Match details:")
                for i, m in enumerate(matches):
                    print(f"[IMAGE_CLICK] Match {i+1}: x={m.x}, y={m.y}, width={m.width}, height={m.height}, confidence={getattr(m, 'confidence', 'N/A')}")
        
        if matches:
            # Get the center of the first match
            match = matches[0]
            x, y = match.x + match.width // 2, match.y + match.height // 2
            
            if debug:
                print(f"[IMAGE_CLICK] Using {description} at coordinates: ({x}, {y}), width: {match.width}, height: {match.height}")
            
            # Show visual feedback if requested
            if show_helper:
                if debug:
                    print(f"[IMAGE_CLICK] Attempting to show cursor helper at ({x}, {y})")
                try:
                    actions.user.show_cursor_helper(x, y)
                    if debug:
                        print(f"[IMAGE_CLICK] Cursor helper displayed successfully")
                except Exception as cursor_error:
                    if debug:
                        print(f"[IMAGE_CLICK] Error showing cursor helper: {str(cursor_error)}")
            
            # Move mouse and click
            if debug:
                print(f"[IMAGE_CLICK] Attempting to move mouse to ({x}, {y})")
            
            actions.mouse_move(x, y)
            
            if debug:
                print(f"[IMAGE_CLICK] Mouse moved to {description} at ({x}, {y})")
                print(f"[IMAGE_CLICK] Attempting to click at current mouse position")
            
            actions.mouse_click()
            
            if debug:
                print(f"[IMAGE_CLICK] Clicked on {description}")
            
            return True
        else:
            error_msg = f"{description} not found on screen"
            if debug:
                print(f"[IMAGE_CLICK] ERROR: {error_msg}")
                # Try to get screen dimensions for debugging
                try:
                    screens = ui.screens()
                    print(f"[IMAGE_CLICK] Available screens: {len(screens)}")
                    for i, screen in enumerate(screens):
                        print(f"[IMAGE_CLICK] Screen {i+1}: {screen}")
                except Exception as screen_error:
                    print(f"[IMAGE_CLICK] Error getting screen info: {str(screen_error)}")
            
            actions.app.notify(error_msg)
            return False
    
    except Exception as e:
        if debug:
            print(f"[IMAGE_CLICK] CRITICAL ERROR locating {description}: {str(e)}")
            print(f"[IMAGE_CLICK] Error type: {type(e).__name__}")
            print(f"[IMAGE_CLICK] Traceback: {traceback.format_exc()}")
        
        actions.app.notify(f"Error: {str(e)}")
        return False
