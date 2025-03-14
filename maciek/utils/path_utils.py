import os

def get_knausj_resource_path(resource_name: str, verify_exists: bool = True) -> str:
    """
    Constructs a path to a resource file in the knausj_talon project.
    
    Args:
        resource_name (str): Name of the resource file (e.g., 'accept2.png', 'stop.png')
        verify_exists (bool, optional): If True, verifies that the resource exists. Defaults to True.
        
    Returns:
        str: Absolute path to the resource file
        
    Raises:
        FileNotFoundError: If verify_exists is True and the resource file doesn't exist
        ValueError: If resource_name is empty or contains path separators
    """
    if not resource_name or not resource_name.strip():
        raise ValueError("Resource name cannot be empty")
        
    # Prevent path traversal by ensuring resource_name doesn't contain path separators
    if os.path.sep in resource_name or (os.path.altsep and os.path.altsep in resource_name):
        raise ValueError(f"Resource name cannot contain path separators: {resource_name}")
    
    # Get the knausj_talon project root directory
    knausj_root = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
    
    # Construct the full path to the resource
    resource_path = os.path.join(knausj_root, "resources", resource_name)
    
    if verify_exists and not os.path.exists(resource_path):
        raise FileNotFoundError(f"Resource not found: {resource_path}")
    
    return resource_path
