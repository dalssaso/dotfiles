#!/usr/bin/env bash

if [[ "$(hostnamectl chassis)" == "desktop" ]]; then
   xrandr --auto --output DisplayPort-1 --mode 3840x2160 --scale 1x1 --dpi 157 --primary --right-of DisplayPort-0 --scale 1x1 --dpi 157 --output DisplayPort-2 --off --output HDMI-A-0 --off
fi
