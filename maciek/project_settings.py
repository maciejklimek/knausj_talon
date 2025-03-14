# from talon import Context, Module, actions, app, fs
# import os
# import json
# import re

# mod = Module()
# mod.tag("project_settings", desc="Enables project-specific settings")

# ctx = Context()
# ctx.tags = ["user.project_settings"]

# current_project = None
# project_settings = {}

# def get_project_path(project_name):
#     """Get the full path to a project directory"""
#     # This assumes projects are in standard locations
#     # You might need to adjust this based on your setup
#     talon_user_path = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
    
#     # Get the actual project directory name from the projects.talon-list file
#     projects_list_path = os.path.join(talon_user_path, "maciek", "apps", "vscode", "projects.talon-list")
#     project_dir = None
#     project_path = None
    
#     if os.path.isfile(projects_list_path):
#         try:
#             with open(projects_list_path, "r") as f:
#                 lines = f.readlines()
                
#             for line in lines:
#                 line = line.strip()
#                 # Skip comments and empty lines
#                 if not line or line.startswith("#"):
#                     continue
                    
#                 if ":" in line and not line.startswith("list:") and not line.startswith("-"):
#                     key, value = line.split(":", 1)
#                     if key.strip() == project_name:
#                         # Check if the value contains a pipe character (|) to separate project_dir and full_path
#                         if "|" in value:
#                             parts = value.strip().split("|")
#                             project_dir = parts[0]
#                             project_path = parts[1]
#                         else:
#                             project_dir = value.strip()
#                         break
#         except Exception as e:
#             print(f"Error reading projects.talon-list: {e}")
    
#     if not project_dir:
#         print(f"Project '{project_name}' not found in projects.talon-list")
#         return None
    
#     # If a full path was provided, use it; otherwise, construct the path from talon_user_path and project_dir
#     if project_path:
#         return project_path
#     else:
#         return os.path.join(talon_user_path, project_dir)

# def parse_talon_list(file_path):
#     """Parse a .talon-list file and return the list name and items"""
#     if not os.path.isfile(file_path):
#         return None, {}
    
#     try:
#         with open(file_path, "r") as f:
#             lines = f.readlines()
        
#         list_name = None
#         items = {}
        
#         for line in lines:
#             line = line.strip()
#             if not line:
#                 continue
                
#             if line.startswith("list:"):
#                 list_name = line.split(":", 1)[1].strip()
#             elif ":" in line and not line.startswith("-"):
#                 key, value = line.split(":", 1)
#                 items[key.strip()] = value.strip()
        
#         return list_name, items
#     except Exception as e:
#         print(f"Error parsing {file_path}: {e}")
#         return None, {}

# def load_project_settings(project_name):
#     """Load settings for the specified project"""
#     global current_project, project_settings
    
#     if project_name == current_project:
#         return
    
#     project_path = get_project_path(project_name)
#     if not project_path:
#         return
    
#     talon_dir = os.path.join(project_path, ".talon")
    
#     if not os.path.isdir(talon_dir):
#         print(f"No .talon directory found for project: {project_name}")
#         # Create the .talon directory
#         try:
#             os.makedirs(talon_dir)
#             print(f"Created .talon directory for project: {project_name}")
#         except Exception as e:
#             print(f"Error creating .talon directory: {e}")
#         return
    
#     # Reset project settings
#     project_settings = {}
    
#     # Load file shortcuts
#     file_shortcuts_path = os.path.join(talon_dir, "file_shortcuts.talon-list")
#     list_name, shortcuts = parse_talon_list(file_shortcuts_path)
    
#     if list_name and shortcuts:
#         project_settings["file_shortcuts"] = shortcuts
#         ctx.lists[list_name] = shortcuts
#         print(f"Loaded {len(shortcuts)} file shortcuts for project: {project_name}")
    
#     # Load vocabulary
#     vocabulary_path = os.path.join(talon_dir, "vocabulary.talon-list")
#     list_name, vocabulary = parse_talon_list(vocabulary_path)
    
#     if list_name and vocabulary:
#         project_settings["vocabulary"] = vocabulary
#         ctx.lists[list_name] = vocabulary
#         print(f"Loaded {len(vocabulary)} vocabulary items for project: {project_name}")
    
#     current_project = project_name
#     print(f"Project settings loaded for: {project_name}")

# def create_template_files(project_name):
#     """Create template .talon-list files for a project"""
#     project_path = get_project_path(project_name)
#     if not project_path:
#         return
    
#     talon_dir = os.path.join(project_path, ".talon")
    
#     if not os.path.isdir(talon_dir):
#         try:
#             os.makedirs(talon_dir)
#             print(f"Created .talon directory for project: {project_name}")
#         except Exception as e:
#             print(f"Error creating .talon directory: {e}")
#             return
    
#     # Create file_shortcuts.talon-list if it doesn't exist
#     file_shortcuts_path = os.path.join(talon_dir, "file_shortcuts.talon-list")
#     if not os.path.isfile(file_shortcuts_path):
#         try:
#             template_path = os.path.join(os.path.dirname(__file__), "templates", "file_shortcuts.talon-list.template")
#             if os.path.isfile(template_path):
#                 with open(template_path, "r") as f:
#                     template_content = f.read()
                
#                 with open(file_shortcuts_path, "w") as f:
#                     f.write(template_content)
                
#                 print(f"Created file_shortcuts.talon-list for project: {project_name}")
#         except Exception as e:
#             print(f"Error creating file_shortcuts.talon-list: {e}")
    
#     # Create vocabulary.talon-list if it doesn't exist
#     vocabulary_path = os.path.join(talon_dir, "vocabulary.talon-list")
#     if not os.path.isfile(vocabulary_path):
#         try:
#             template_path = os.path.join(os.path.dirname(__file__), "templates", "vocabulary.talon-list.template")
#             if os.path.isfile(template_path):
#                 with open(template_path, "r") as f:
#                     template_content = f.read()
                
#                 with open(vocabulary_path, "w") as f:
#                     f.write(template_content)
                
#                 print(f"Created vocabulary.talon-list for project: {project_name}")
#         except Exception as e:
#             print(f"Error creating vocabulary.talon-list: {e}")

# def setup_file_watchers():
#     """Set up watchers for project settings files"""
#     # This would set up file watchers to detect changes in .talon-list files
#     # and reload them automatically
#     pass

# # Initialize
# app.register("ready", setup_file_watchers)

# @mod.action_class
# class Actions:
#     def switch_project(project_name: str):
#         """Switch to the specified project and load its settings"""
#         load_project_settings(project_name)
        
#     def reload_project_settings():
#         """Reload settings for the current project"""
#         if current_project:
#             load_project_settings(current_project)
            
#     def create_project_templates(project_name: str):
#         """Create template .talon-list files for a project"""
#         create_template_files(project_name)
