#!/usr/bin/env bash

if [[ ! $(pidof polybar) ]]; then
    polybar -q -c $HOME/.config/polybar/config.ini top &
else
    polybar-msg cmd restart
fi

