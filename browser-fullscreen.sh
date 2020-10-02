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
echo "[COMMAND] xdotool search --name \".*${WINDOW_SEARCH}.*- (Google Chrome|Chromium|Mozilla Firefox)\"| head -n1"
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
echo "[COMMAND] xdotool getwindowname ${WINDOW_ID}"
WINDOW_TITLE=$(xdotool getwindowname ${WINDOW_ID})

# verify Window Title was acquired
if [ -z "${WINDOW_TITLE}" ]; then
    echo "[ERROR] Unable to acquire Window Title for '${WINDOW_ID}'"
    exit 1
else
    echo "[INFO] Window Title: ${WINDOW_TITLE}"
fi

# get full size of screen (ex. 1920x1080)
echo "[TASK] Getting the screen's size in pixels using xdotool ..."
echo "[COMMAND] xdotool getdisplaygeometry | tr ' ' 'x' | grep -Eo '[0-9]+x[0-9]+'"
SCREEN_SIZE=$(xdotool getdisplaygeometry | tr ' ' 'x' | grep -Eo '[0-9]+x[0-9]+')
# try using xwininfo instead of xdotool
if [ -z "${SCREEN_SIZE}" ]; then
    echo "[WARNING] Unable to acquire screen size with xdotool"
    echo "[TASK] Attempting to use xwininfo to get screen size ..."
    echo "[COMMAND] xwininfo -root | grep 'geometry' | grep -Eo '[0-9]+x[0-9]+'"
    SCREEN_SIZE=$(xwininfo -root | grep 'geometry' | grep -Eo '[0-9]+x[0-9]+')
fi

# verify screen size was acquired
if [ -z "${SCREEN_SIZE}" ]; then
    echo "[WARNING] Unable to acquire screen size"
    echo "[INFO] Defaulting to '1920x1080'"
    SCREEN_SIZE='1920x1080'
fi

echo "[INFO] Screen Size: ${SCREEN_SIZE}"

# check to see if any window is fullscreened already
echo "[TASK] Getting the window's size in pixels using xdotool ..."
echo "[COMMAND] xdotool getwindowgeometry \"${WINDOW_ID}\" | grep -i 'geometry' | grep -Eo '[0-9]+x[0-9]+'"
WINDOW_SIZE=$(xdotool getwindowgeometry "${WINDOW_ID}" | grep -i 'geometry' | grep -Eo '[0-9]+x[0-9]+')

# try using xwininfo instead of xdotool
if [ -z "${WINDOW_SIZE}" ]; then
    echo "[WARNING] Unable to acquire window size with xdotool"
    echo "[TASK] Attempting to use xwininfo to get window size ..."
    echo "[COMMAND] xwininfo -id \"${WINDOW_ID}\" | grep 'geometry' | grep -Eo '[0-9]+x[0-9]+'"
    WINDOW_SIZE=$(xwininfo -id "${WINDOW_ID}" | grep 'geometry' | grep -Eo '[0-9]+x[0-9]+')
fi

# verify window size was acquired
if [ -z "${WINDOW_SIZE}" ]; then
    echo "[WARNING] Unable to acquire window size"
    SCREEN_SIZE='Unknown'
fi

echo "[INFO] Window Size: ${WINDOW_SIZE}"

# if window is not fullscreened
if [ "${WINDOW_SIZE}" != "${SCREEN_SIZE}" ]; then
    echo "[INFO] Window is not fullscreened"
    # activate window, then send F11 key to fullscreen
    echo "[TASK] Activating window and sending F11 key ..."
    echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key F11"
    xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key F11
    sleep 3
else 
    echo "[INFO] Window is already fullscreened"
fi

# if a YouTube video, fullscreen it
if [[ "${WINDOW_TITLE}" =~ '- YouTube -' ]]; then
    echo "[TASK] Activating YouTube video window and sending f key ..."
    echo "[COMMAND] xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key f"
    xdotool windowactivate ${WINDOW_ID} && sleep 2 && xdotool key f
fi