mode: user.python
mode: command
and code.language: python
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

#python-specific grammars
dunder in it: "__init__"
state (def | deaf | deft): "def "
self taught: "self."

state past: "pass"

^funky <user.text>$: user.code_default_function(text)
# ^funky that$: user.code_default_function(text)
#^pro funky <user.text>$: user.code_protected_function(text)
^pub funky <user.text>$: user.code_public_function(text)
#^static funky <user.text>$: user.code_private_static_function(text)
#^pro static funky <user.text>$: user.code_protected_static_function(text)
#^pub static funky <user.text>$: user.code_public_static_function(text)
raise {user.python_exception}: user.insert_cursor("raise {python_exception}([|])")

# for annotating function parameters
is type {user.python_type_list}:
    insert(": {python_type_list}")
returns [type] {user.python_type_list}:
    insert(" -> {python_type_list}")
    # for generic reference of types
type {user.python_type_list}:
    insert("{python_type_list}")
dock {user.python_docstring_fields}:
    insert("{python_docstring_fields}")
    edit.left()
dock type {user.python_type_list}:
    user.insert_cursor(":type [|]: {python_type_list}")
dock returns type {user.python_type_list}:
    user.insert_cursor(":rtype [|]: {python_type_list}")
toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)

    # print [<user.text>]:
    #     insert("print()")
    #     key(left)
    #     insert(\"text\" or "")
    # print:
    #     insert("print(\"\")")
    #     key(left left)
print:
    insert("print()")
    key(left)
return: insert("return ")
await: insert("await ")
a sync: insert("async ")
import: insert("import ")
# type:
#     insert("type()")
#     key(left)
state del: insert("del ")
help:
    insert("help()")
    key(left)
self: insert("self")
# def: insert("def")

insert {user.snippets}:
    user.vscode("editor.action.insertSnippet")
    sleep(30ms)
    insert("{user.snippets}")
    key(enter)


run this: user.vscode("python.execInTerminal")
