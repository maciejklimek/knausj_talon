from talon import Context, Module

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.c_stdint_datatypes
"""


c_stdint_types = {
    "character": "int8_t",
    "char": "int8_t",
    "short": "int16_t",
    "long": "int32_t",
    "long long": "int64_t",
    "int": "int32_t",
    "integer": "int32_t",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
}
ctx.lists["user.c_types"] = c_stdint_types
