#!/bin/bash

min_brightness=10
down=14400 # 15% of max_brightness
actual_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)

# Calculate new brightness value
new_brightness=$(( actual_brightness - down ))

# Check if new brightness is less than min_brightness
if [ $new_brightness -lt $min_brightness ]; then
    new_brightness=$min_brightness
fi

# Update the brightness
echo $new_brightness > /sys/class/backlight/intel_backlight/brightness
