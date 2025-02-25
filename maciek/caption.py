from talon import Module, ui, canvas, cron

mod = Module()

# Global variables to manage canvas and cron job
notification_canvas = None
notification_job = None

@mod.action_class
class Actions:
    def display_notification(text: str, duration: float = 2.0, font_size: int = 48, height_fraction: float = 0.5):
        """Display a caption notification on the screen.
        
        Args:
            text: Text to display
            duration: How long to show the text in seconds
            font_size: Size of the font
            height_fraction: Where vertically to show the text (0.0 = top, 1.0 = bottom)
        """
        global notification_canvas, notification_job

        # Close the existing canvas if it exists
        if notification_canvas:
            notification_canvas.close()
            notification_canvas = None

        # Get the screen dimensions
        screen = ui.main_screen()
        screen_width = screen.width
        screen_height = screen.height

        # Create a new canvas
        def on_draw(c):
            # Define the text style
            paint = c.paint
            paint.textsize = font_size
            paint.color = "white"
            paint.antialias = True

            # Calculate the text width and position
            text_width = paint.measure_text(text)[0]
            x = (screen_width - text_width) / 2
            y = screen_height * height_fraction

            # Draw the text
            c.draw_text(text, x, y)

        notification_canvas = canvas.Canvas.from_screen(screen)
        notification_canvas.register("draw", on_draw)
        notification_canvas.freeze()  # Render the canvas

        # Schedule the canvas to be removed after the specified duration
        if notification_job:
            cron.cancel(notification_job)
        notification_job = cron.after(f"{int(duration * 1000)}ms", lambda: remove_notification())

def remove_notification():
    """Removes the notification canvas."""
    global notification_canvas, notification_job
    if notification_canvas:
        notification_canvas.close()
        notification_canvas = None
    notification_job = None