# ^microphone list$: user.microphone_selection_toggle()
^microphone pick <number_small>$: user.microphone_select(number_small)
# ^microphone show$: 

^microphone air$: sound.set_microphone("MacBook Air Microphone")
^microphone u s b$: sound.set_microphone("USB Audio Device")
^microphone rode$: sound.set_microphone("Wireless GO II RX")
microphone show [active]: 
    talon_mic_name = sound.active_microphone()
    macos_mic_name = user.get_macos_current_microphone()
    notification_text = user.concat_4("Talon microphone: ", talon_mic_name, "\nMacos microphone: ", macos_mic_name)
    user.display_notification(notification_text)

# ^microphone yeti$: sound.set_microphone("Yeti Stereo Microphone")
# ^microphone crisp$: sound.set_microphone("krisp microphone")
