# This is a custom set of rules to control a obs-studio script I wrote in order
# to automatically record all sessions, and splice interesting parts.

#tag: user.obs_studio_global
-
cast start:
    user.system_command("/home/aa/source/obs-cli/obs-cli.py --start-recording")
    app.notify("obs-studio recording started")
cast stop:
    user.system_command("/home/aa/source/obs-cli/obs-cli.py --stop-recording")
    app.notify("obs-studio recording stopped")
cast pause:
    user.system_command("/home/aa/source/obs-cli/obs-cli.py --pause-recording")
    app.notify("obs-studio recording paused")
cast resume:
    user.system_command("/home/aa/source/obs-cli/obs-cli.py --resume-recording")
    app.notify("obs-studio recording resumed")
cast show:
    user.system_command("/home/aa/source/obs-cli/obs-cli.py --maximize")
cast hide:
    user.system_command("/home/aa/source/obs-cli/obs-cli.py --minimize")
cast splice:
    app.notify("Not implemented")
cast splice <number_small> minutes:
    app.notify("Not implemented")
