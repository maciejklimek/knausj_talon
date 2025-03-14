from pynput.keyboard import Key, Controller, KeyCode
import time
import argparse
from typing import List, Union, Optional

class ModifierKeys:
    """Mapping of modifier key names to their Key objects."""
    MODIFIERS = {
        'cmd': Key.cmd,  # Command key on macOS
        'ctrl': Key.ctrl,
        'alt': Key.alt,  # Option key on macOS
        'shift': Key.shift,
        'option': Key.alt,  # Alternative name for alt on macOS
        'command': Key.cmd,  # Alternative name for cmd
    }

def get_key(key_name: str) -> Union[Key, KeyCode]:
    """Convert key name string to appropriate Key or KeyCode object."""
    # Check if it's a modifier key
    if key_name.lower() in ModifierKeys.MODIFIERS:
        return ModifierKeys.MODIFIERS[key_name.lower()]
    
    # Check if it's a special key (like f1, f2, etc)
    try:
        return getattr(Key, key_name.lower())
    except AttributeError:
        # If not a special key, treat as a regular character
        if len(key_name) == 1:
            return KeyCode.from_char(key_name)
        else:
            raise ValueError(f"Invalid key: {key_name}. Must be a single character or a special key name.")

def simulate_key_event(
    key_name: str,
    event_type: str = 'both',
    delay: float = 0.1,
    modifiers: Optional[List[str]] = None
):
    """Simulate a key event (press, release, or both) with optional modifier keys.
    
    Args:
        key_name: Name of the key (e.g., 'a', 'f17', 'shift')
        event_type: Type of event ('press', 'release', or 'both')
        delay: Delay in seconds between press and release when event_type is 'both'
        modifiers: List of modifier keys to hold during the key event
    """
    keyboard = Controller()
    key = get_key(key_name)
    modifier_keys = [get_key(mod) for mod in (modifiers or [])]
    
    try:
        # Press modifier keys first
        for mod in modifier_keys:
            print(f"Pressing modifier: {mod}")
            keyboard.press(mod)
        
        # Handle the main key
        if event_type in ['press', 'both']:
            print(f"Pressing key: {key_name}")
            keyboard.press(key)
        
        if event_type == 'both':
            time.sleep(delay)
        
        if event_type in ['release', 'both']:
            print(f"Releasing key: {key_name}")
            keyboard.release(key)
        
    finally:
        # Always release modifier keys in reverse order
        for mod in reversed(modifier_keys):
            print(f"Releasing modifier: {mod}")
            keyboard.release(mod)

def main():
    parser = argparse.ArgumentParser(description='Simulate keyboard key events')
    parser.add_argument('key', help='Key to simulate (e.g., f17, a, shift)')
    parser.add_argument('--modifiers', '-m', nargs='+',
                        help='Modifier keys to hold (e.g., cmd ctrl shift option)')
    parser.add_argument('--event-type', '-e', choices=['press', 'release', 'both'],
                        default='both', help='Type of key event to simulate')
    parser.add_argument('--delay', '-d', type=float, default=0.1,
                        help='Delay between press and release for "both" event type')
    parser.add_argument('--repeat', '-r', type=int, default=1,
                        help='Number of times to repeat the event')
    parser.add_argument('--interval', '-i', type=float, default=0.5,
                        help='Interval between repeated events')
    parser.add_argument('--start-delay', '-s', type=float, default=2.0,
                        help='Initial delay before starting simulation')
    
    args = parser.parse_args()
    
    print(f"Starting key simulation in {args.start_delay} seconds...")
    time.sleep(args.start_delay)
    
    for i in range(args.repeat):
        if i > 0:
            time.sleep(args.interval)
        print(f"\nRound {i + 1}:")
        simulate_key_event(args.key, args.event_type, args.delay, args.modifiers)
    
    print("\nSimulation completed")

if __name__ == '__main__':
    main()
