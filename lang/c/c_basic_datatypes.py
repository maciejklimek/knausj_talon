from talon import Context, Module

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.c_basic_datatypes
"""

c_basic_types = {
    "character": "char",
    "char": "char",
    "short": "short",
    "long": "long",
    "int": "int",
    "integer": "int",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
}
ctx.lists["user.c_types"] = c_basic_types
print(ctx.lists)
