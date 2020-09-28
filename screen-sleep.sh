#!/bin/bash
# purpose: puts screen into standby mode
# author: Jeff Reeves

# minimize the current window (reduces CPU load)
echo "[TASK] Minimize current window (reduces CPU load) ..."
# TODO:
# - updated minimize to all windows that are important, not just active
# xdotool search --onlyvisible --class 'chrome|chromium|terminal'
echo "[COMMAND] xdotool getactivewindow windowminimize"
xdotool getactivewindow windowminimize

# put screen to sleep/blank
echo "[TASK] Put screen to sleep/blank ..."
echo "[COMMAND] xset dpms force standby"
xset dpms force standby

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Screen is now asleep"
fi