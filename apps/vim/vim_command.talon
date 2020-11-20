# These commands had only make sense to be exposed of vim is currently in
# command mode
# See `:help cmdline`

win.title: /VIM MODE:c/
-

paste register <any>: key(ctrl-r {any})

# Command-line completion: help:cmdline-completion
match names: key(ctrl-a)
