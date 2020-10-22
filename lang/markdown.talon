mode: user.markdown
mode: command
and code.language: markdown
-

state task: "- [ ] "

# XXX - make work with generic editor commends
#make link:
#    edit.insert("[](")
#    edit.word_end

# XXX - Update to something that uses the [|] trick
link clip:
    insert("(here)[")
    edit.paste()
    insert("]")
