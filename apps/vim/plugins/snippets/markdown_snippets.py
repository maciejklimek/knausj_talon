# from user.knausj_talon.code.snippet_watcher import snippet_watcher
import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
app: vim
mode: user.markdown
mode: command
and code.language: markdown
"""
# spoken name -> ultisnips snippet name
ctx.lists["user.snippets"] = {
    # Sections and Paragraphs #
    "section": "sec",
    "sub section": "ssec",
    "sub sub section": "sssec",
    "paragraph": "par",
    "sub paragraph": "spar",
    # Text formatting #
    "italics": "*",
    "bold": "**",
    "bold italics": "***",
    "comment": "/*",
    # Common stuff #
    "link": "link",
    "image": "img",
    "inline code": "ilc",
    "code block": "cbl",
    "reference link": "refl",
    "footnote": "fnt",
    "detail": "detail",
}
