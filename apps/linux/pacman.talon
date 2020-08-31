os: linux
tag: user.terminal
-
pacman: "pacman "
pacman search: "pacman -sS "
pacman search <user.text>: "pacman -sS {text}"
pacman install: "pacman -S "
pacman install <user.text>: "pacman -S {text}"
pacman remove: "pacman -R "
