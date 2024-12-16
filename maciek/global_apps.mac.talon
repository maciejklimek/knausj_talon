# os: mac
# -
# print modes:
#     print(user.list_modes())

# ^horse$:
#     user.focus_chrome_app()

# ^coder$:
#     user.focus_cursor_app("", "")

# ^panda$:
#     user.focus_chatgpt_app()
#     sleep(100ms)

# panda this:
#     edit.copy()
#     user.focus_chatgpt_app()
#     sleep(100ms)
#     edit.paste()

# ^tango$:
#     user.focus_claude_app()

# ^tango this$:
#     edit.copy()
#     user.focus_claude_app()
#     sleep(200ms)
#     edit.delete_all()
#     edit.paste()

# ^tango explain this$:
#     edit.
#     copy()
#     user.focus_claude_app()
#     sleep(200ms)
#     edit.delete_all()
#     insert("explain this:   ")
#     edit.paste()

# ^thomas$:
#     user.focus_teams_app()

# ^thomas calendar$:
#     user.focus_teams_app()
#     sleep(50ms)
#     key("cmd-4")

# ^thomas chat$:
#     user.focus_teams_app()
#     sleep(50ms)
#     key("cmd-2")

    
# # ^tiger$:
# #     print("intelij")
# #     key("ctrl-5")
# #     sleep(100ms)
# #     user.rephrase(phrase or "")

# ^puppy$:
#     user.focus_kitty_app()

# ^obsidian$:
#     user.focus_obsidian_app()

# ^outlook$:
#     user.focus_outlook_app()