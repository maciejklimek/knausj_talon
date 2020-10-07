from talon import Context, Module

mod = Module()

tagList = [
    "debugger",
    "disassembler",
    "firefox",
    "gdb",
    "ida",
    "tabs",
    "terminal",
    "tmux",
    "windbg",
    "i3wm",
]
for entry in tagList:
    mod.tag(entry, f"tag to load {entry} and/or related plugins ")
