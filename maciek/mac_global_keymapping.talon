os: mac
-
###############################################################################
### Apple keyboard shortcuts
###############################################################################

key(f6): user.talon_sleep_toggle()


###############################################################################
### KeyPad
###############################################################################

key(keypad_8): user.talon_sleep_toggle()
# key(keypad_7): user.webspeech_polish_dictation_mode_enable()
key(keypad_9): 
    # user.webspeech_polish_dictation_mode_disable()
    user.command_mode()
# key(keypad_5): 
#     user.webspeech_polish_dictation_mode_disable()
#     user.dictation_mode()    
#
# key(keypad_): user.save_bad_recognition()

# TODO(maciejk): This is a duplication
# key(keypad_1): 
#     key("ctrl-1")
#     user.switcher_focus_and_wait("google chrome")
#     sleep(100ms)
#     user.rephrase(phrase or "")

# key(keypad_2): 
#     key("ctrl-2")
#     user.switcher_focus_and_wait("code", 0.5)
#     sleep(100ms)
#     user.rephrase(phrase or "")

# key(keypad_3): 
#     key("ctrl-3")

#     sleep(100ms)
#     user.rephrase(phrase or "")

key(keypad_4):
    print("execute_next_action")
    user.execute_next_action()

key(keypad_1:down):
    user.whisper_mode()
    user.whisper_start_dictation()

key(keypad_1:up):
    res = user.whisper_stop_dictation()
    print("got")
    print(res)
    insert(res)
    user.command_mode()



###############################################################################
### Pedal
###############################################################################
deck(pedal_middle:down): 
    print("pedal_middle:down")
    user.start_whisper_mode_and_start_dictation()

# key(cmd-f17:down):
#     print("cmd-f17:down")
#     user.webspeech_polish_dictation_mode_enable()
# key(cmd-f17:up):
#     print("cmd-f17:up")
#     user.webspeech_polish_dictation_mode_disable()
deck(pedal_middle:up): 
    print("pedal_middle:up")
    res = user.whisper_stop_dictation()
    print("got")
    print(res)
    insert(res)
    user.command_mode()

deck(pedal_left:down):
    print("pedal_left:down")
    user.dictation_mode()

deck(pedal_left:up):
    print("pedal_left:up")
    user.command_mode()

deck(pedal_right):
    "middle right"

# key(keypad_1):
#     key("ctrl-1") 
#     user.switcher_focus_and_wait("google chrome")
# key(keypad_2):
#     key("ctrl-2") 
#     user.switcher_focus_and_wait("code", 0.5)
# key(keypad_3):
#     key("ctrl-3") 
#     user.switcher_focus_and_wait("kitty", 0.5)
#     # When the key is post for a longer time the action is not repeated.
# # key(keypad_plus:up):    key("pageup")
# key(cmd-ctrl-alt-shift-p:repeat): key("pageup")
# key(keypad_enter):    key("pagedown")
# key(keypad_enter:repeat):    key("pagedown")
# key(keypad_4): key(cmd-`)    
# key(cmd-ctrl-alt-shift-z):user.go_back()
# # key(keypad_5):
# #     user.engine_sleep()
# #     key(cmd-shift-alt-\)
# # there is a mapping in karabiner configuration for this
# key(f13):core.repeat_command(1)

# key(ctrl-f):
#     key(cmd-alt-shift-f1)
