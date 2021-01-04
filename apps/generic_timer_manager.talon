tag: terminal
tag: user.timer_manager
-

#timer: user.timer()
timer restart: user.timer_restart()
timer reload: user.timer_reload()
timer stop: user.timer_stop()
timer start: user.timer_start()
timer status: user.timer_status()
timer enable: user.timer_enable()
timer disable: user.timer_disable()
timer help: user.timer_help()
timer kill: user.timer_kill()
timer is enabled: user.timer_is_enabled()

# timer's specific to user vs system-wide
timer user: user.timer()
timer user restart: user.timer_user_restart()
timer user reload: user.timer_user_reload()
timer user stop: user.timer_user_stop()
timer user start: user.timer_user_start()
timer user status: user.timer_user_status()
timer user enable: user.timer_user_enable()
timer user disable: user.timer_user_disable()
timer user help: user.timer_user_help()
timer user kill: user.timer_user_kill()
timer user is enabled: user.timer_user_is_user_enabled()
