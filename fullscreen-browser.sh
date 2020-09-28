#!/bin/bash
# purpose: activates a Chrome/Chromium/Firefox window and 
#   presses F11 to fullscreen it
# author: Jeff Reeves

# if window title parameter was not passed, prompt for valid input
if [ -z ${1} ]; then
    read -p "[PROMPT] Enter a full or partial browser window's title " WINDOW_TITLE
else
    WINDOW_TITLE=${1}
fi

# get window ID
echo "[TASK] Getting Window ID for title '${WINDOW_TITLE}' ..."
WINDOW_ID=$(xdotool search --name ".*${WINDOW_TITLE}.*- (Google Chrome|Chromium|Mozilla Firefox)"| head -n1)

# verify window ID was acquired
if [ -z ${WINDOW_ID} ]; then
    echo "[ERROR] Unable to acquire Window ID for '${WINDOW_TITLE}'"
    exit 1
else
    echo "[INFO] Window ID: ${WINDOW_ID}"
fi

# activate window, then send F11 key to fullscreen
echo "[TASK] Activating window and sending F11 key ..."
echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && xdotool key F11"
#xdotool windowactivate ${WINDOW_ID} && xdotool key F5
xdotool windowactivate ${WINDOW_ID} && xdotool key F11