# See https://github.com/rhysd/vim-grammarous
tag: user.vim_grammarous

# by default this grammar file is using the calls to the <Plug> calls rather
# than using mappings, but this is very slow so it's recommended that you come
# up with your own mappings for all of the <Plug> calls and then call those
# mappings instead

-
grammar check:
    user.vim_normal_mode_exterm(':GrammarousCheck\n')

grammar help:
    user.vim_normal_mode_exterm(':GrammarousCheck --help\n')

grammar reset:
    user.vim_normal_mode_exterm(':GrammarousReset\n')

grammar fix:
    user.vim_command_mode_exterm(':execute "normal \\<Plug>(grammarous-fixit)"\n')
