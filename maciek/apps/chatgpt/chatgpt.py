import os
import time
from talon import Module, Context, actions, clip, ui

mod = Module()

mod.apps.chatgpt = """
app.name: chatgpt
"""

mod.apps.chatgpt = """
os: mac
and app.bundle: com.openai.chatgpt
"""

ctx = Context()

ctx.matches = r"""
app: chatgpt
"""

@mod.action_class
class Actions:
    def chatgpt_new_chat():
        """Start a new chat in ChatGPT"""
        actions.key("cmd-n")

    