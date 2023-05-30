#!/usr/bin/env bash

# Copied from https://github.com/Mastermindzh/dotfiles/commit/9714b2fa1d670108ce811d5511fd3b7a43180647

TIDAL_HOST="http://localhost:47836"

function httpGet() {
	curl -s "$TIDAL_HOST/$1"
}

function httpSilentGet() {
	curl -s -o /dev/null "$TIDAL_HOST/$1"
}

case $1 in
"play")
	httpSilentGet play
	;;
"pause")
	httpSilentGet pause
	;;
"playpause")
	httpSilentGet playpause
	;;
"next")
	httpSilentGet next
	;;
"previous")
	httpSilentGet previous
	;;
"info")
	JSON=$(httpGet current)
	TITLE=$(echo "$JSON" | jq -r '.title')
	ARTISTS=$(echo "$JSON" | jq -r '.artist')
	INFO="$TITLE - $ARTISTS"
	if [ ${#INFO} -ge 3 ]; then
		echo "$INFO"
	fi
	;;
"status")
	if httpGet current | grep "paused" >/dev/null; then
		echo "paused"
	else
		echo "playing"
	fi
	;;
*)
	echo "tidal-cli doesn't know this command"
	;;
esac
