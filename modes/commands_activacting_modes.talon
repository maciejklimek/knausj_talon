-
^dictate [<phrase>]$:   user.dictation_mode(phrase or "")
# ^(text field mode) [<phrase>]$:   user.text_field_mode(phrase or "")
^polish$: user.webspeech_polish_dictation_mode_enable()

^whisper$:  
    user.whisper_mode()
    user.whisper_start_dictation()

webspeech english [<phrase>]$:   user.webspeech_english_dictation_mode(phrase or "")
^command mode [<phrase>]$:   user.command_mode(phrase or "")

^mixed mode$:
    mode.disable("sleep")
    mode.enable("dictation")
    mode.enable("command")

# Kinesis Keyboard Shortcut
key(cmd-shift-f18):
    user.start_whisper_mode_and_start_dictation()
