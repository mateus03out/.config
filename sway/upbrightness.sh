#!/bin/bash

max_brightness=96000
up=14400 # 15% of max_brightness
actual_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)

# Calculate new brightness value
new_brightness=$(( actual_brightness + up ))

# Check if new brightness exceeds max_brightness
if [ $new_brightness -gt $max_brightness ]; then
    new_brightness=$max_brightness
fi

# Update the brightness
echo $new_brightness > /sys/class/backlight/intel_backlight/brightness
