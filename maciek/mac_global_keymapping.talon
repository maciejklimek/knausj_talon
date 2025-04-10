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

    
# Wispr Flow  
# key(f7:down):
#     print(50 * "=")
#     print("f7:down")
#     user.maybe_talon_sleep()
#     user.start_flow_continuous()
#     print(50 * "*")

# key(f7:up):
#     print(50 * "=")
#     print("f7:up")
#     user.maybe_talon_wake_up()
#     user.stop_flow_continuous()
#     print(50 * "*")

# key(f12:down):
#     print(50 * "=")
#     print("f12:down")
#     user.maybe_talon_sleep()
#     # user.start_flow_continuous()
#     print(50 * "*")

# key(f12:up):
#     print(50 * "=")
#     print("f12:up")
#     user.maybe_talon_wake_up()
#     # user.stop_flow_continuous()
#     print(50 * "*")

# There is a problem with this because when I'm in a VSCode terminal, some string is passed to the terminal. I tried to block this, but it didn't work. 
key(f8:passive):
    print(50 * "=")
    print("f8")
    # sleep(50ms)
    user.toggle_flow()
    print(50 * "*")
    
# key(keypad_0:down):
#     print("keypad_0:down")
#     user.maybe_talon_sleep()
#     user.start_flow_continuous()

# key(keypad_0:up):
#     print("keypad_0:up")
#     user.maybe_talon_wake_up()
#     user.stop_flow_continuous()



# key(f8:down):
#     print("f8:down")
#     user.maybe_talon_sleep()
#     user.start_flow()
    
# key(f8:up):
#     print("f8:up")
#     user.maybe_talon_wake_up()
#     user.stop_flow()

# key(f4:down): 
#     user.maybe_talon_sleep()
#     user.start_whisper_mode_and_start_dictation()

# key(f3:down):
#     user.maybe_talon_sleep()
    # user.start_whisper_mode_and_start_dictation()


###############################################################################
### Pedal
###############################################################################
deck(pedal_middle:down): 
    print("pedal_middle:down")
    user.maybe_talon_sleep()
    user.start_flow_continuous()

deck(pedal_middle:up): 
    print("pedal_middle:up")
    user.maybe_talon_wake_up()
    user.stop_flow_continuous()
 
deck(pedal_right:down):
    key(enter)

# deck(pedal_right:down):
#     print("pedal_right:down")
#     key(cmd:down)

# deck(pedal_right:up):
#     print("pedal_right:up")
#     key(cmd:up)


# deck(pedal_right):
#     "middle right"
    
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
