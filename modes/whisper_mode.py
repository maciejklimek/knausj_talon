import json
import requests
from talon import Module, actions

mod = Module()
mod.mode("whisper")

def whisper_start_dictation():
    """Start dictation mode"""
    # Sending a POST request
    print("Whisper starting dictation")
    response = requests.post('http://localhost:5006/start')

    # Checking the response
    if response.status_code == 200:
        print("Request was successful")
        print(response.text)
    else:
        print(f"Failed with status code: {response.status_code}")
    return response.status_code


@mod.action_class
class Actions:
    def start_whisper_mode_and_start_dictation():
        """Enter whisper mode and start dictation"""
        if whisper_start_dictation() == 200:
            actions.user.whisper_mode()
        else:
            print("Failed to start whisper dictation, not entering whisper mode")
                
    def whisper_stop_dictation(language: str = None) -> str:
        """Stop dictation mode"""
        # Sending a POST request
        print(f"Stopping dictation with language: {language}")
        data = {
            'language': language
        }
        response = requests.post('http://localhost:5006/stop', json=data)
        # Checking the response
        if response.status_code == 200:
            print("Request was successful")
            # decode json
            data = json.loads(response.text)
            if 'transcription' in data:
                print(f"transcript: {data['transcription']}")
                transcription = data['transcription']
                transcription = transcription.rstrip('\n')
                return transcription
                
            # print(response.text)
        else:
            print(f"Failed with status code: {response.status_code}")