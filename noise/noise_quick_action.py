from talon import Module 

mod = Module()

mod.tag("noise_quick_actions", desc="A tag for enabling noise quick actions")
mod.setting(
    "noise_quick_actions",
    type=int,
    default=0,
    desc="Control enabling quick action assignment for noises",
)

