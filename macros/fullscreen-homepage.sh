#!/bin/bash
# purpose: activates Homepage Chromium window and presses F11 to fullscreen it

# get window ID
echo "[TASK] Getting Window ID for title 'Homepage' ..."
WINDOW_ID=$(xdotool search --name 'Homepage')

# verify window ID was acquired
if [ -z ${WINDOW_ID} ]; then
    echo "[ERROR] Unable to acquire Window ID for 'Homepage'"
    exit 1
else
    echo "[INFO] Window ID: ${WINDOW_ID}"
fi

# activate window, send F5 key to refresh, and then send F11 key to fullscreen
echo "[TASK] Activating window and sending F11 key ..."
echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && xdotool key F11"
xdotool windowactivate ${WINDOW_ID} && xdotool key F5
xdotool windowactivate ${WINDOW_ID} && xdotool key F11