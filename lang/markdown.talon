mode: user.markdown
mode: command
and code.language: markdown
-

code block:
    insert("```\n\n")
    insert("```\n")
    key(up:2)
state task: "- [ ] "

# XXX - make work with generic editor commends
#make link:
#    insert("[](")
#    edit.word_end

# XXX - Update to something that uses the [|] trick
link clip:
    insert("(here)[")
    edit.paste()
    insert("]")
