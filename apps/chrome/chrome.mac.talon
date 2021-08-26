os: mac
app: chrome
-
tag(): browser
tag(): user.tabs
#action(browser.address):

action(browser.bookmark):
	key(cmd-d)

action(browser.bookmark_tabs):
	key(cmd-shift-d)
	
action(browser.bookmarks):
	key(cmd-alt-b)
  
action(browser.bookmarks_bar):
	key(cmd-shift-b)

action(browser.focus_address): 
	key(cmd-l)
	
#action(browser.focus_page): 

action(browser.focus_search):
	browser.focus_address()

action(browser.go_blank):
	key(cmd-n)
	
action(browser.go_back):
	key(cmd-left)

action(browser.go_forward):
	key(cmd-right)
	
action(browser.go_home):
	key(cmd-shift-h)

action(browser.open_private_window):
	key(cmd-shift-n)

action(browser.reload):
	key(cmd-r)

action(browser.reload_hard):
	key(cmd-shift-r)

#action(browser.reload_hardest):
	
action(browser.show_clear_cache):
	key(cmd-shift-delete)
  
action(browser.show_downloads):
	key(cmd-shift-j)

#action(browser.show_extensions)

action(browser.show_history):
	key(cmd-y)
	
action(browser.submit_form):
	key(enter)

#action(browser.title)

action(browser.toggle_dev_tools):
	key(cmd-alt-i)

show links: key("f")
link: key("f")
new link: key(shift-f)

go search [<user.text>]$: 
    key("o")
    sleep(200ms)
    insert(text or "")
    
go search that: 
    key("o")
    sleep(200ms)
    key(cmd-v)

copy link: key(y f)
copy (address | url): 
    key(escape y y)
    sleep(100ms)

close: 
    app.tab_close()
    sleep(40ms)
go front: browser.go_forward()
next: app.tab_next()
last: app.tab_previous()
back: browser.go_back()
front: browser.go_forward()

go find [<user.text>]$: 
    key(cmd-f)
    sleep(200ms)
    insert(text or "")
    # user.text_field_mode(phrase or "")

find this:
    key(cmd-c)
    key(cmd-f)
    sleep(200ms)
    key(cmd-v)

    