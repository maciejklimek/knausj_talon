from talon import Module, actions, cron
from talon.grammar import Phrase
from typing import Union

mod = Module()


@mod.action_class
class Actions:
    def text_field_mode(phrase: Union[Phrase, str] = None):
        """Enter dictation mode and re-evaluate phrase"""
        # We should get the current mode instead of the "command" mode here.
        actions.mode.disable("command")
        actions.mode.enable("user.text_field")

        if phrase:
            actions.user.rephrase(phrase, run_async=True)

    def command_mode(phrase: Union[Phrase, str] = None):
        """Enter command mode and re-evaluate phrase"""
        # I checked and I couldn't find a method to get the current mode. so as a hack we are disabling all possible modes.
        print("Entering command mode")
        actions.mode.disable("dictation")
        actions.mode.disable("user.webspeech_polish_dictation")
        actions.mode.disable("user.whisper")
        actions.mode.disable("user.text_field")

        actions.mode.enable("command")
        if phrase:
            actions.user.rephrase(phrase, run_async=True)

    def dictation_mode(phrase: Union[Phrase, str] = None):
        """Enter dictation mode and re-evaluate phrase"""
        print("Entering dictation mode")
        actions.mode.disable("command")
        actions.mode.enable("dictation")
        if phrase:
            actions.user.rephrase(phrase, run_async=True)
            
    def whisper_mode():
        """Enter whisper mode"""
        print("Entering whisper mode")
        actions.mode.disable("command")
        actions.mode.enable("user.whisper")
        

    def webspeech_polish_dictation_mode_enable():
        """Enter dictation mode and re-evaluate phrase"""
        print("Entering webspeech polish dictation mode")
        actions.mode.disable("command")
        actions.mode.enable("user.polish")
        actions.mode.enable("dictation")
        print("turning on polish dictation")

        # if phrase:
            # actions.user.rephrase(phrase, run_async=False)

    def webspeech_polish_dictation_mode_disable():
        """Enter dictation mode and re-evaluate phrase""" 
        print("Exiting webspeech polish dictation mode")
        actions.mode.disable("dictation")
        actions.mode.disable("user.polish")
        actions.mode.enable("command")
        print("turning off polish dictation")

    def webspeech_english_dictation_mode(phrase: Union[Phrase, str] = None):
        """Enter webspeech dictation mode and re-evaluate phrase"""
        print("Entering english dictation mode")
        actions.mode.disable("command")
        actions.mode.enable("user.webspeech_english_dictation")
        if phrase:
            actions.user.rephrase(phrase, run_async=False)