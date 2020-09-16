from talon import Context, Module, actions

mod = Module()
mod.list("paths", desc="Common paths")


@mod.capture
def paths(m) -> str:
    "One path"


ctx = Context()
ctx.lists["user.paths"] = {
    "sessions": "~/.vim/sessions/",
}


@ctx.capture(rule="{user.paths}")
def paths(m):
    return m.paths
