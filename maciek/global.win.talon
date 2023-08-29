os: windows
-
prod password: "Produktoskop2023\n"
horse$:
    user.switcher_focus("Microsoft Edge")
    # user.rephrase(phrase or "")

coder$:
    user.switcher_focus("Visual Studio Code")
    # user.rephrase(phrase or "")

# puppy$:user.focus_puppy()
puppy$:
    user.switcher_focus("WindowsTerminal.exe")

teams$:
    user.switcher_focus("Microsoft Teams")


code search:
    user.open_url("https://sourcegraph.com/search")


polo replace:
    user.system_command('code C:\\Users\\maciej.klimek\\projects\\knausj_talon\\settings\\words_to_replace.csv')
    user.switcher_focus_and_wait("Visual Studio Code", 0.5)
    user.engine_mimic("pour file")

polo replace:
    user.system_command('code C:\\Users\\maciej.klimek\\projects\\knausj_talon\\settings\\additional_words.csv')
    user.switcher_focus_and_wait("Visual Studio Code", 0.5)
    user.engine_mimic("pour file")


# switcher_focus wait until ui.active_app() == app,
# But does this mean that talon made the context switch,  so that we can use rephrase?
# park [<phrase>]$:
#     key("ctrl-4")
#     # user.maciek_switch_to_app("obsidian")
#     user.switcher_focus("obsidian")
#     user.rephrase(phrase or "")


# This is temporary


