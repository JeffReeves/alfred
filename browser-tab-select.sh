#!/bin/bash
# purpose: activates a Chrome/Chromium/Firefox window and 
#   presses alt+<num> to select a particular tab
# author: Jeff Reeves

# if window search parameter was not passed, prompt for valid input
if [ -z "${1}" ]; then
    read -p "[PROMPT] Enter a tab number " TAB_NUMBER
else
    TAB_NUMBER="${1}"
fi

# get window ID of active browser
echo "[TASK] Getting active browser's window ID ..."
echo "[COMMAND] xdotool search --name \".*- (Google Chrome|Chromium|Mozilla Firefox)\"| head -n1"
WINDOW_ID=$(xdotool search --name ".*- (Google Chrome|Chromium|Mozilla Firefox)"| head -n1)

# verify window ID was acquired
if [ -z ${WINDOW_ID} ]; then
    echo "[ERROR] Unable to acquire Window ID for an active browser"
    echo "[HELP] Verify a browser window is running"
    exit 1
else
    echo "[INFO] Window ID: ${WINDOW_ID}"
fi

# send alt+<num> keystroke to active browser
echo "[TASK] Activating window and sending alt+${TAB_NUMBER} key ..."
echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key alt+${TAB_NUMBER}"
xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key alt+${TAB_NUMBER}