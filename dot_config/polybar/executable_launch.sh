#!/usr/bin/env bash

if [[ ! $(pidof polybar) ]]; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload top &
    done
else
    polybar-msg cmd restart
fi
