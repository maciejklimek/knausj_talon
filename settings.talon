-
settings():
    # Whether to show the mode indicator from the plugins
    user.mode_indicator_show = false

    #adjust the scale of the imgui to my liking
    imgui.scale = 1.3
    imgui.dark_mode = 1
    # enable if you'd like the picker gui to automatically appear when explorer has focus
    
    #set the max number of command lines per page in help
    user.help_max_command_lines_per_page = 50
    # set the max number of contexts display per page in help
    user.help_max_contexts_per_page = 20
    # The default amount used when scrolling continuously
    
    #stop continuous scroll/gaze scroll with a pop
    
    #enable pop click with 'control mouse' mode
    
    #When enabled, the 'Scroll Mouse' GUI will not be shown.
    
    #hide cursor when mouse_wake is called to enable zoom mouse
    
    #the amount to scroll up/down (equivalent to mouse wheel on Windows by default)
    
    #mouse grid and friends put the number one on the bottom left (vs on the top left)
    user.grids_put_one_bottom_left = 1
    # the number of lines of command history to display by default

    # Commented because of the WARNING
    # user.command_history_display = 10
    # user.file_manager_auto_show_pickers = 0
    # user.mouse_continuous_scroll_amount = 6
    # user.rango_direct_clicking =1
    # user.mouse_hide_mouse_gui = 0
    # user.mouse_wake_hides_cursor = 0
    # user.mouse_wheel_down_amount = 120
    # user.mouse_enable_pop_stops_scroll = 1
    # user.command_history_size = 50
    # user.mouse_enable_pop_click = 1
    
    # the number of lines of command history to keep in total;
    # "command history more" to display all of them, "command history less" to restore

    
    speech.record_all = 1
    speech.record_labels = 1
    # What does it really do?
    # speech.normalize = 1

    # user.cursorless_settings_directory = "knausj_talon/cursorless-settings"
    # when this was set to 0.3,  the normal speech was cut off sometimes.  this assumes that normalize = 1,
    # and input volume on macOS settings is 50%
    # But when I set it to = 0.25  the sound of keyboard clicks is being picked up as activity
    # speech.threshold = 0.2
    # speech.threshold = .0

    speech.timeout = 0.300
    speech.debug = 1
    # speech.timeout = 0.180
    # Uncomment the below to enable context-sensitive dictation. This determines
    # how to format (capitalize, space) dictation-mode speech by selecting &
    # copying surrounding text before inserting. This can be slow and may not
    # work in some applications. You may wish to enable this on a
    # per-application basis.
    user.context_sensitive_dictation = 1


# uncomment tag to enable mouse grid
# tag(): user.mouse_grid_enabled
