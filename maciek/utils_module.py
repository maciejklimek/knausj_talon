from talon import Context, actions, ui, Module, app
import time

mod = Module()


@mod.action_class
class Actions:
    def maybe_sleep(miliseconds: int, text: str):
        """this description is mandatory"""
        if len(text) > 0:
            time.sleep(miliseconds / 1000)

    def maybe_enter(text: str):
        """this description is mandatory"""
        if len(text) > 0:
            actions.key("enter")

    def go_up(n: int):
        """This description is mhndatory"""
        for i in range(n):
            actions.edit.up()

    def go_down(n: int):
        """This description is mandatory"""
        for i in range(n):
            actions.edit.down()
