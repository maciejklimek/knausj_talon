from talon import Context, Module

mod = Module()

tagList = [
    "debugger",
    "disassembler",
    "firefox",
    "gdb",
    "git",  # commandline tag for git commands
    "ida",
    "tabs",
    "tmux",
    "windbg",
    "yay",
    "apt",
    "buku",
    "ghidra_server",
    "nmcli",
    "taskwarrior",
    "timewarrior",
    "make",
    "kubectl",
    "tmux",
    "docker",
    "git",
]

for entry in tagList:
    mod.tag(entry, f"tag to load {entry} and/or related plugins ")
