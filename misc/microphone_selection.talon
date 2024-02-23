^microphone list$: user.microphone_selection_toggle()
^microphone pick <number_small>$: user.microphone_select(number_small)
# ^microphone show$: 
^microphone air$: speech.set_microphone("MacBook Air Microphone")
^microphone u s b$: speech.set_microphone("USB Audio Device")
^microphone yeti$: speech.set_microphone("Yeti Stereo Microphone")