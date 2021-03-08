question [mark]: "?"
score: "_"
double dash: "--"
triple quote: '"""'
triple tick: "'''"
gravy: "```"
(dot dot | dotdot): ".."
ellipses: "..."
(comma and | spamma): ", "
plus: "+"
arrow: "->"
dub arrow: "=>"
new line: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
end of file: "EOF"
dotty: "../"
empty (string|quotes):
    '""'
    key(left)
empty escaped (string|quotes):
    '\\"\\"'
    key(left)
    key(left)
empty ticks:
    "''"
    key(left)
empty escaped ticks:
    "\\'\\'"
    key(left)
    key(left)

[pair] (parens|args):
	insert("()")
[pair] (brackets|braces): "{}"
[pair] squares: "[]"
[pair] angles: "<>"
[pair] graves: "``"
[pair] percents: "%%"
[pair] ticks: "''"
[pair] quotes: '""'
(inside parens | args):
	insert("()")
	key(left)
inside (squares | list):
	insert("[]")
	key(left)
inside (bracket | braces):
	insert("{}")
	key(left)
inside percent:
	insert("%%")
	key(left)
inside quotes:
	insert('""')
	key(left)
angle that:
    text = edit.selected_text()
    user.paste("<{text}>")
(bracket | brace) that:
    text = edit.selected_text()
    user.paste("{{{text}}}")
(parens | args) that:
    text = edit.selected_text()
    user.paste("({text})")
percent that:
    text = edit.selected_text()
    user.paste("%{text}%")
quote that:
    text = edit.selected_text()
    user.paste('"{text}"')
