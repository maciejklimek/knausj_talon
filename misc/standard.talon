(numb|number) <number>: insert("{number}")
(shock|slap): key(enter)
dot pie: ".py"
dot talon: ".talon"
dot mark down: ".md"
dot shell: ".sh"
dot vim: ".vim"
dot see: ".c"
dot com: ".com"
dot net: ".net"
dot org: ".org"
dot exe: ".exe"
dot bin: ".bin"
dot text: ".txt"
dot session: ".session"
dot jason: ".json"

(jay son | jason ): "json"
(http | htp): "http"
tls: "tls"
M D five: "md5"
string U T F eight:
	insert("'utf8'")

(regex | rejex): "regex"

[pair] (parens|args):
	insert("()")
[pair] (brackets|braces): "{}"
[pair] squares: "[]"
[pair] angles: "<>"
[pair] graves: "``"
[pair] percents: "%%"

# XXX - block alone conflicts with vim key words
add code block:
	insert("{}")
	key(left enter enter up tab)

zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_out()
(page | scroll) up: key(pgup)
(page | scroll) down: key(pgdown)
copy that: edit.copy()
cut that: edit.cut()
paste that: edit.paste()
paste match: edit.paste_match_style()
file save: edit.save()

#menu help: key(F1)
#spotlight: key(super)
#(undo that | skunks): edit.undo()
#redo that: edit.redo()
volume up: key(volup)
volume down: key(voldown)
mute: key(mute)
play next: key(next)
play previous: key(prev)

(play | pause): key(play_pause)

local host: "127.0.0.1"
(hex|hexadecimal) [(num|number)] <number>: "0x{number}"
#hex (num|number) <number>: "0x{number}"
hyper:
    edit.copy()
    edit.paste()
sucker:
    edit.copy()
    edit.paste()
    key(enter)
pucker:
    edit.paste()
    key(enter)

web link: "https://"
insecure web link: "http://"
file link: "file://"
