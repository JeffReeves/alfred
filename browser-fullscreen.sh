#!/bin/bash
# purpose: activates a Chrome/Chromium/Firefox window and 
#   presses F11 to fullscreen it (and presses f to fullscreen YouTube videos)
# author: Jeff Reeves

# if window search parameter was not passed, prompt for valid input
if [ -z "${1}" ]; then
    read -p "[PROMPT] Enter a full or partial browser window's title " WINDOW_SEARCH
else
    WINDOW_SEARCH="${1}"
fi

# get window ID
echo "[TASK] Getting Window ID for title '${WINDOW_SEARCH}' ..."
WINDOW_ID=$(xdotool search --name ".*${WINDOW_SEARCH}.*- (Google Chrome|Chromium|Mozilla Firefox)"| head -n1)

# verify window ID was acquired
if [ -z ${WINDOW_ID} ]; then
    echo "[ERROR] Unable to acquire Window ID for '${WINDOW_SEARCH}'"
    exit 1
else
    echo "[INFO] Window ID: ${WINDOW_ID}"
fi

# get full window name
echo "[TASK] Getting the full Window Title from Window ID ..."
WINDOW_TITLE=$(xdotool getwindowname ${WINDOW_ID})

# verify Window Title was acquired
if [ -z "${WINDOW_TITLE}" ]; then
    echo "[ERROR] Unable to acquire Window Title for '${WINDOW_ID}'"
    exit 1
else
    echo "[INFO] Window Title: ${WINDOW_TITLE}"
fi

# activate window, then send F11 key to fullscreen
echo "[TASK] Activating window and sending F11 key ..."
echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key F11"
xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key F11
sleep 3

# if a YouTube video, fullscreen it
if [[ "${WINDOW_TITLE}" =~ '- YouTube -' ]]; then
    echo "[TASK] Activating YouTube video window and sending f key ..."
    echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key f"
    xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key f
fi