#!/bin/sh

type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
	brew install --cask 1password
	brew install --cask 1password-cli
	read -p "Press Enter to continue after configuring 1password in the UI" </dev/tty
	;;
# Linux)
# 	# commands to install password-manager-binary on Linux
# 	;;
*)
	echo "unsupported OS"
	exit 1
	;;
esac
