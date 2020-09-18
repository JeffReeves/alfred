#!/bin/bash
# purpose: wakes screen up from standby mode
# author: Jeff Reeves

# turn screen on
echo "[TASK] Waking screen..."
echo "[COMMAND] xset dpms force on"
xset dpms force on

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Screen is awake now"
fi
