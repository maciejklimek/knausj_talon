#defines the various mode commands
not mode: user.presentation
-
#welcome back:
#    user.mouse_wake()
#    user.history_enable()
#    speech.enable()
sleep all:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    app.notify("Talon Sleep All Mode")
(talon|talent) sleep:
    speech.disable()
    user.talon_sleep_callback()
    app.notify("Talon Sleep")
talon wake:
    speech.enable()
    app.notify("Talon Awake")
    user.talon_wake_callback()
^dictation mode$:
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    app.notify("Dictation Mode")
    user.code_clear_language_mode()
    mode.disable("user.gdb")

^talon mode$:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.enable("command")
    app.notify("Command Mode")

^presentation mode$:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    app.notify("Presentation Mode")
    mode.enable("user.presentation")
