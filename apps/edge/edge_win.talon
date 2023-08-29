os: windows
app: edge
-
tag(): browser
tag(): user.tabs
###############################################################################
### vimium
###############################################################################
page next: insert("]]")
page last: insert("[[")
page crown: key("ctrl-up")
scroll:key(n)
scroll up:key(u)
page refresh: key("ctrl-r")

show links: key("f")
link: key("f")

new link: key(shift-f)

search [<user.text>]$:
    key("o")
    sleep(200ms)
    insert(text or "")

search that:
    key("o")
    sleep(200ms)
    key(ctrl-v)

copy link: key(y f)
u r l copy:
    key(ctrl-l)
    key(ctrl-c)
    # key(e§ape y y)
    sleep(100ms)

address [<user.text>]:
    key(ctrl-l)
    sleep(50ms)
    insert(text or "")

address [<user.text>]:
    key(ctrl-l)
    sleep(50ms)
    insert(text or "")

jump [<user.text>]:
    key(ctrl-shift-a)
    sleep(100ms)
    insert(text or "")

close:
    app.tab_close()
    sleep(40ms)
go front: browser.go_forward()

next$: app.tab_next()
last$: app.tab_previous()
back$: browser.go_back()
front$: browser.go_forward()

google [<user.text>]$:
password fill:
    key(ctrl-shift-l)

tab open [<user.text>]$:
    app.tab_open()
    sleep(100ms)
    insert(text or "")



find [<user.text>]$:
    key(ctrl-f)
    sleep(200ms)
    insert(text or "")
    # user.text_field_mode(phrase or "")

find this:
    key(ctrl-c)
    key(ctrl-f)
    sleep(200ms)
    key(ctrl-v)


###############################################################################
### Keyboard shortcuts
###############################################################################
key(ctrl-g):
    text = edit.selected_text()
    user.search_with_search_engine("https://www.google.com/search?q=%s", text)

###############################################################################
### KeyPad shortcuts
###############################################################################
key(shift-ctrl-alt-ctrl-9):
    key(ctrl-right)
key(shift-ctrl-alt-ctrl-8):
    key(ctrl-left)
# asterisk
key(shift-ctrl-alt-ctrl-a):
    key(ctrl-alt-right)
key(shift-ctrl-alt-ctrl-/):
    key(ctrl-alt-left)
key(shift-ctrl-alt-ctrl-m):
        key(ctrl-w)

test google:
    text = edit.selected_text()

    user.search_with_search_engine("https://www.google.com/search?q=%s", text)

history:
    key(ctrl-h)
bookmark:
    key(ctrl-d)

# This is for the search
key(ctrl-enter): key(ctrl-enter)
let <user.letters>: insert(letters)
