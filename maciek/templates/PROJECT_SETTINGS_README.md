# Project Settings for Talon

This system allows you to define project-specific settings for Talon, such as file shortcuts and vocabulary. These settings are stored in a `.talon` directory at the root of each project.

## Setup

1. Create a `.talon` directory in your project root:
   ```
   mkdir -p /path/to/your/project/.talon
   ```

2. Create the necessary `.talon-list` files in this directory:
   - `file_shortcuts.talon-list`: Defines project-specific file shortcuts
   - `vocabulary.talon-list`: Defines project-specific vocabulary

## File Format

The `.talon-list` files use a simple format:

```
list: user.list_name
-

key1: value1
key2: value2
```

## Example

### file_shortcuts.talon-list
```
list: user.file_shortcuts
-

readme: README.md
config: config.json
main: src/main.py
```

### vocabulary.talon-list
```
list: user.project_vocabulary
-

api: API
json: JSON
config: configuration
```

## Usage

To switch to a project and load its settings:
```
switch project <project_name>
```

To reload the current project's settings:
```
reload project settings
```

## Adding New Projects

Add new projects to the `projects.talon-list` file in the `maciek/apps/vscode` directory.
