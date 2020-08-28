
mode: user.vimscript
mode: command
and code.language: vimscript
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
# XXX - revisit these
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"


###
# Generic Actions - see appropriate generic talon file for spoken command
###

# operators - see lang/operators.talon
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "

# comments - see lang/code_comment.talon
action(user.code_comment): "\""

# conditionals - see lang/xxx

###
# VIM Script Specific
###
[<user.vim_scope>] variable [<user.text>] [over]:
    insert("let ")
    insert(vim_variable_types or '')
    user.code_private_variable_formatter(text)

# see lang/vimscript/vimscript.py for list
<user.vimscript_function>:
    insert("{vimscript_function} ")

state command: "command! "
