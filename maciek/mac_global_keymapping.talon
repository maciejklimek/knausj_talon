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
key(keypad_9): 
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


# key(ctrl-shift-b:down):
#     user.maybe_talon_sleep()
#     print("ctrl-shift-b:down")
#     # key(b:down
#     # key(ctrl-shift-b:down)

# key(ctrl-shift-b:up):
#     user.maybe_talon_wake_up()
#     print("ctrl-shift-b:up")
    # key(ctrl-shift-b:up)

# key(keypad_1:down):
#     user.maybe_talon_sleep()

# key(keypad_1:up):
#     user.maybe_talon_wake_up()



key(keypad_4):
    print("execute_next_action")
    user.execute_next_action()

    

# key(keypad_1:down):
#     user.whisper_mode()
#     user.start_whisper_mode_and_start_dictation()

# key(keypad_1:up):
#     res = user.whisper_stop_dictation()
#     print("got")
#     print(res)
#     insert(res)
#     user.command_mode()

# key(f5:down):
#     user.maybe_talon_sleep()
#     user.start_flow()

# key(f5:up):
#     user.maybe_talon_wake_up()
#     user.stop_flow()
    

key(f7:down):
    print("f7:down")
    user.maybe_talon_sleep()
    user.start_flow()

key(f7:up):
    print("f7:up")
    user.maybe_talon_wake_up()
    user.stop_flow()

# key(f4:down): 
#     user.maybe_talon_sleep()
#     user.start_whisper_mode_and_start_dictation()

# key(f3:down):
#     user.maybe_talon_sleep()
#     user.start_whisper_mode_and_start_dictation()


###############################################################################
### Pedal
###############################################################################
deck(pedal_middle:down): 
    print("pedal_middle:down")
    user.maybe_talon_sleep()
    key(ctrl-shift-b:down)

deck(pedal_middle:up): 
    print("pedal_middle:up")
    user.maybe_talon_wake_up()
    key(ctrl-shift-b:up)

deck(pedal_left:down):
    key(enter)

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
v