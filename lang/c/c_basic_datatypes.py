from talon import Context, Module

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.c_stdint_datatypes
"""

ctx.lists["user.c_types"] = ctx.lists["user.c_stdint_types"]
