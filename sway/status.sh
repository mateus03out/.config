#!/bin/bash

#time
time=$(date "+%a %F %H:%M:%S")
#battery
battery=$(cat /sys/class/power_supply/BAT1/capacity)
status_battery=$(cat /sys/class/power_supply/BAT1/status)
#brightness
brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=96000
perc_brightness=$(( brightness * 100 / max_brightness))
#volume
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o [0-9.] | tr -d '\n')
volume="  $volume"
if [ $(pactl list sinks | grep -A 10 'Sink #' | grep 'Mute:' | tr -d 'Mute: \t') = 'ys' ]; then
	volume=󰝟
fi
echo "$volume | 󰃠 $perc_brightness% | 󰁹 $battery% $status_battery |  $time |"
