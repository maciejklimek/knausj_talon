os: mac
-
print modes:
    print(user.list_modes())

^horse$:
    user.focus_or_launch_chrome_app("Maciej Klimek - normal profile")
    #key("ctrl-1")
    #sleep(100ms)
    #user.rephrase(phrase or "")

^monkey$:
    user.focus_or_launch_chrome_app("Maciej Klimek - deepsense.ai profile")


^coder$:
    user.focus_or_launch_windsurf_app("", "")

^panda$:
    user.focus_chatgpt_app()
    sleep(100ms)

panda this:
    edit.copy()
    user.focus_chatgpt_app()
    sleep(100ms)
    edit.paste()

# ^tango$:
#     user.focus_claude_app()

# ^tango this$:
#     edit.copy()
#     user.focus_claude_app()
#     sleep(200ms)
#     edit.delete_all()
#     edit.paste()

# ^tango explain this$:
#     edit.copy()
#     user.focus_claude_app()
#     sleep(200ms)
#     edit.delete_all()
#     insert("explain this:   ")
#     edit.paste()

^thomas$:
    user.focus_teams_app()

^grok$:
    user.focus_grok_app()

# ^tiger$:
#     print("intelij")
#     key("ctrl-5")
#     sleep(100ms)
#     user.rephrase(phrase or "")

^puppy$:
    user.focus_kitty_app()
^obsidian$:
    user.focus_obsidian_app()
`
^outlook$:
    user.focus_outlook_app()
    
# switcher_focus_and_wait wait u, 0.5ntil ui.active_app() == app,
# But does this mean that talon made the context switch,  so that we can use rephrase?
# park [<phrase>]$:
#     key("ctrl-4")
#     # user.maciek_switch_to_app("obsidian")
#     user.switcher_focus_and_wait("obsid, 0.5ian")
#     user.rephrase(phrase or "")

###############################################################################
### general editing commands
###############################################################################

notes toggle: key(cmd-shift-f6)

wipe | thrash: key(alt-backspace)
(clear | wipe | thrash) all:
    edit.select_all()
    edit.delete()

down: key(down)

###############################################################################
### menu
###############################################################################
menu help: key(cmd-shift-/)
menu show:
    key(ctrl-shift-f2)
    sleep(100ms)
    key(enter)

###############################################################################
### raycast
###############################################################################
spot [<user.text>]:
    key(alt-space)
    sleep(50ms)
    insert(text or "")

clipboard: user.raycast_clipboard()
spot close: key(cmd-w)

# raindrop search [<user.text>]:
#     user.raycast_raindrop_search(text or "")
# raindrop recent:
#     key(cmd-shift-f5)

talon play: user.run_in_fish_shell("osascript -e 'tell app \"Terminal\" to activate' -e 'tell app \"Terminal\" to do script \"talon-play-latest\"'")

talon play last: user.run_in_fish_shell("talon-play-pre-last")
talon restart: user.run_in_fish_shell("talon-restart")

puppy talon: user.focus_talon_window()

^ (run this) | (puppy this) $:
    edit.copy()
    user.focus_kitty_app()
    sleep(1000ms)
    key(ctrl-u)
    sleep(50ms)
    edit.paste()
    key(enter)

# ###########################################
# # Open specific files in knausj_talon
# ###########################################
# # ^polo mac o s:
# #     user.vscode_projects(vscode_open_project)("knausj_talon")
# #     user.run_in_fish_shell("code /Users/maciek/projects/knausj_talon/maciek/macOS.talon")
# #     user.switcher_focus_and_wait("code", 0.5)
# #     key(cmd-down)
# #     key(enter)

# ^coder files obsidian:
#     user.run_in_fish_shell("cursor /Users/maciek/projects/knausj_talon/maciek/apps/obsidian/obsidian.mac.talon")
#     user.switcher_focus_and_wait("cursor", 0.5)
#     key(cmd-down)
#     key(enter)

^coder files additional:
    user.focus_windsurf_app("knausj_talon", "settings/additional_words.csv")

^coder files vs code:
    user.focus_windsurf_app("knausj_talon", "apps/vscode/vscode.talon")

^coder files command line$:
    user.focus_windsurf_app("knausj_talon", "maciek/commandline.talon")

# ^coder files chrome$:
#     user.run_in_fish_shell("cursor /Users/maciek/projects/knausj_talon/maciek/chrome_mac.talon")
#     user.switcher_focus_and_wait("cursor", 0.5)
#     key(cmd-down)
#     key(enter)

^coder files websites$:
    user.focus_windsurf_app("knausj_talon", "settings/websites.csv")
    sleep(500ms)
    user.engine_mimic("slap file")

^coder files replace:
    user.focus_windsurf_app("knausj_talon", "settings/words_to_replace.csv")
    user.switcher_focus_and_wait("cursor", 0.5)
    user.engine_mimic("slap file")

# anki
anki vscode:
    user.run_in_fish_shell("code /Users/maciek/obsidian/maciek-knowledge/vscode\ talon\ anki.md")
    user.switcher_focus_and_wait("anki", 0.5)
    key(cmd-down)
    key(enter)
anki basic:
    user.run_in_fish_shell("code /Users/maciek/obsidian/maciek-knowledge/talon\ basic\ anki.md")
    user.switcher_focus_and_wait("anki", 0.5)
    key(cmd-down)
    key(enter)

###############################################################################
### app management
###############################################################################
windows: key(ctrl-down)
all windows: key(ctrl-up)
switch: key(cmd-`)

# input method
# input maciek:
#     user.system_command("/opt/homebrew/bin/im-select casadelmaciek.inputmethod.MaciekInputMethod")
# input polish:

###############################################################################
### vimac
###############################################################################
links: key(cmd-alt-shift-f1)

# I have problems with these words
(truce | moon | choice) <number_small>:
    key(down)
    repeat(number_small-2)
    key(enter)

# click up task$:
#     user.switcher_focus_and_wait("click", 0.5)
#     key(t)

# ^polo help coder: user.raycast_talon_search("vscode")

# ^coder project [<user.text>]$: user.raycast_coder_project(text or "")
^ helmet | polo search [<user.text>] $: user.raycast_talon_search(text or "")
# github repo [<user.text>]:

create note: key("cmd-shift-f8")

lend | (line end): key(cmd-right)

zoom in: edit.zoom_in()
zoom out: edit.zoom_out()

take screenshot:
    key(shift-cmd-ctrl-4)
take save screenshot:
    key(shift-cmd-4)
#com.axissecurity.client.ui
# focus atmos:

# vscode
coder <user.vscode_project_names>:
    user.focus_or_launch_windsurf_app(vscode_project_names)

modes print:
    print(scope.get("mode"))
