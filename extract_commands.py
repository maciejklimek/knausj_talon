import os
import re

def extract_spoken_commands(file_content):
    # Adjusting the regular expression to match lines that start with a caret (^) or include pipes (|)
    pattern = re.compile(r"^\s*(\^?[\w\s\|\[\]\(\)\<\>\:\$]+)\s*:", re.MULTILINE)
    matches = pattern.findall(file_content)
    return matches

def process_talon_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
        commands = extract_spoken_commands(content)
        return commands

def process_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.talon'):
                file_path = os.path.join(root, file)
                commands = process_talon_file(file_path)
                if commands:
                    # Print the filename as a header
                    print(f"# {file}\n")
                    # Print each command
                    for command in commands:
                        print(f"- {command}")
                    # Add a blank line between files
                    print("\n")

if __name__ == "__main__":
    directory = "."  # Set this to your desired directory
    process_directory(directory)