# XXX - this should have os awarenss
from talon import Context, Module, actions

mod = Module()
mod.list("paths_public", desc="Common paths")
mod.list("paths_private", desc="Common private paths")



ctx = Context()
ctx.lists["user.paths_public"] = {
    "user services": "~/.config/systemd/user/",
    "services": "/etc/systemd/system/",
    "sessions": "~/.vim/sessions/",
    "plugins": "~/.vim/plugged/",
    "temp": "/tmp",
    "config": "/etc",
    "user": "/usr",
    "user lib": "/usr/lib",
    "log": "/var/log",
    "password": "/etc/passwd",
    "shadow": "/etc/shadow",
    "hosts": "/etc/hosts",
    "resolve": "/etc/resolv.conf",
    "null": "/dev/null",
    "zero": "/dev/zero",
    "vim": "~/.vim/",
    "shell config": "~/.ohmyzsh",
    "shell functions": "~/.ohmyzsh/custom/functions/",
    "dot files": "~/dotfiles",
}

ctx.lists["user.paths_private"] = {}

# XXX - add support for selecting
windows_paths = {
    "desktop": "%USERPROFILE%\\Desktop",
    "profile": "%USERPROFILE%",
    "root": "%SYSTEMROOT%",
    "windows": "%SYSTEMROOT%",
    "system": "%SYSTEMROOT%\\System32",
    "drivers": "%SYSTEMROOT%\\System32\\Drivers",
    "programs": "%PROGRAMFILES%",
}


@mod.capture(rule="{user.paths_public}")
def paths_public(m)-> str:
    return m.paths_public


@mod.capture(rule="{user.paths_private}")
def paths_private(m)-> str:
    "One private path"
    return m.paths_private


@mod.capture(rule="<user.paths_public>|<user.paths_private>")
def paths(m)-> str:
    "One path"
    return m
