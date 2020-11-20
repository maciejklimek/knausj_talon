tag: user.terminal
-

pulse command: "pacmd "
pulse list sources: "pacmd "
pulse devices: "pacmd list-sources | grep -e 'index:' -e device.string -e 'name:'\n"
# simplified list to show device names
pulse sources: "pacmd list-sources | grep -e 'index:' -e device.string -e 'name:'\n"

pulse edit defaults: "sudo vim /etc/pulse/default.pa\n"
