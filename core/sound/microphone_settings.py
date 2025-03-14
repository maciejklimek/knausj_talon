from talon import Module

mod = Module()

# Add setting for default microphone
mod.setting(
    "default_microphone",
    type=str,
    default="System Default",
    desc="Default microphone to use when enabling the microphone",
)

print("Registered setting: user.default_microphone")
