#!/bin/bash
# purpose: close any open running instances of Chromium or 
#   Google Chrome
# author: Jeff Reeves

# TODO:
# - rename to close-browser.sh
# - use wmctrl or another utility to close any browser

# verify wmctrl is installed
WMCTRL_PRESENT=$(which wmctrl)
if [ -z "${WMCTRL_PRESENT}" ]; then
    echo "[WARNING] wmctrl command is not present"
    echo "[TASK] Installing wmctrl..."
    echo "[COMMAND] sudo apt-get install wmctrl -y"
    sudo apt-get install wmctrl -y
fi

# close chrome gracefully
echo "[TASK] Closing Chromium/Chrome gracefully..."
echo "[COMMAND] wmctrl -c \"- Chromium\""
echo "[COMMAND] wmctrl -c \"- Google Chrome\""
echo "[COMMAND] wmctrl -c \"Google Hangouts\""
wmctrl -c "- Chromium"
wmctrl -c "- Google Chrome"
wmctrl -c "Google Hangouts"
