mode: dictation
mode: user.webspeech_english_dictation
-
^press <user.keys>$: key("{keys}")

post [<phrase>]$:   user.command_mode(phrase or "")

# Everything here should call auto_insert to preserve the state to correctly auto-capitalize/auto-space.
<user.prose>: auto_insert(prose)
new line: "\n"
new paragraph: "\n\n"
cap <user.word>:
    result = user.formatted_text(word, "CAPITALIZE_FIRST_WORD")
    auto_insert(result)
    
# Navigation
go up <number_small> (line|lines):
    edit.up()
    repeat(number_small - 1)
go down <number_small> (line|lines):
    edit.down()
    repeat(number_small - 1)
go left <number_small> (word|words):
    edit.word_left()
    repeat(number_small - 1)
go right <number_small> (word|words):
    edit.word_right()
    repeat(number_small - 1)
go line start: edit.line_start()
go line end: edit.line_end()

# Selection
select left <number_small> (word|words):
    edit.extend_word_left()
    repeat(number_small - 1)
select right <number_small> (word|words):
    edit.extend_word_right()
    repeat(number_small - 1)
select left <number_small> (character|characters):
    edit.extend_left()
    repeat(number_small - 1)
select right <number_small> (character|characters):
    edit.extend_right()
    repeat(number_small - 1)
clear left <number_small> (word|words):
    edit.extend_word_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> (word|words):
    edit.extend_word_right()
    repeat(number_small - 1)
    edit.delete()
clear left <number_small> (character|characters):
    edit.extend_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> (character|characters):
    edit.extend_right()
    repeat(number_small - 1)
    edit.delete()

# Formatting
formatted <user.format_text>:
    user.dictation_insert_raw(format_text)
^format selection <user.formatters>$:
    user.formatters_reformat_selection(formatters)

# Corrections
scratch that: user.clear_last_phrase()
scratch selection: edit.delete()
select that: user.select_last_phrase()
spell that <user.letters>: auto_insert(letters)
spell that <user.formatters> <user.letters>:
    result = user.formatted_text(letters, formatters)
    user.auto_format_pause()
    auto_insert(result)
    user.auto_format_resume()

# Escape, type things that would otherwise be commands
^escape <user.text>$:
    auto_insert(user.text)

numb <user.number_string>: "{number_string}"
numb <user.number_string> (dot | point) <digit_string>: "{number_string}.{digit_string}"


