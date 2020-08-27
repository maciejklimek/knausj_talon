settings():
    #stop continuous scroll/gaze scroll with a pop
    user.mouse_enable_pop_stops_scroll = 0
    #enable pop click with 'control mouse' mode
    user.mouse_enable_pop_click = 1
    #hide cursor when mouse_wake is called to enable zoom mouse
    user.mouse_wake_hides_cursor = 1
    user.mouse_enable_zoom_auto_click = 0
    user.mouse_zoom_auto_click_timeout = 1.2

###
# Configuration
###
mouse sleep:
    user.mouse_sleep()
# sometimes the tobii stops tracking when awake, and triggering wake again won't fix it
mouse wake:
    user.mouse_sleep()
    user.mouse_wake()
control mouse: user.mouse_toggle_control_mouse()
camera overlay: eye_mouse.camera_overlay.toggle()
(mouse|run) calibration: user.mouse_calibrate()
[(enable|disable)] zoom mouse: user.mouse_toggle_zoom_mouse()
[(enable|disable)] zoom auto click: user.mouse_toggle_zoom_auto_click()

###
# General clicking
###
(touch|chiff): user.mouse_click(0, 1)
(righty|rick): user.mouse_click(1, 1)

#see keys.py for modifiers.
#defaults
#command
#control
#option = alt
#shift
#super = windows key

<user.modifiers> (touch|chiff):
    key("{modifiers}:down")
    user.mouse_click(0, 1)
    key("{modifiers}:up")
<user.modifiers> (righty|rick):
    key("{modifiers}:down")
    user.mouse_click(1, 1)
    key("{modifiers}:up")
dyke:
    user.mouse_click(0, 2)
trike:
    user.mouse_click(0, 3)

###
# Scrolling and dragging
###
wheel down: user.mouse_scroll_down()
wheel tiny [down]: mouse_scroll(20)
wheel downer: user.mouse_scroll_down_continuous()
wheel up: user.mouse_scroll_up()
wheel tiny up: mouse_scroll(-20)
wheel upper: user.mouse_scroll_up_continuous()
wheel gaze: user.mouse_gaze_scroll()
wheel stop: user.mouse_scroll_stop()
wheel left: mouse_scroll(0, -40)
wheel tiny left: mouse_scroll(0, -20)
wheel right: mouse_scroll(0, 40)
wheel tiny right: mouse_scroll(0, 20)
curse (show|yes): user.mouse_show_cursor()
curse (hide|no): user.mouse_hide_cursor()
drag: user.mouse_drag()

###
# Zoom features
###
# disables zoom without clicking in case it fails
cancel zoom: user.mouse_cancel_zoom_mouse()
# non-pop zoom single click (auto click if enabled)
(kiff|eagle): user.mouse_zoom_single_click()
# non-pop zoom single click (auto click even if autoclick setting disabled)
kit: user.mouse_zoom_auto_single_click()
