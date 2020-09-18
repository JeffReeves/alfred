#!/bin/bash
# purpose: close any open running instances of Chromium or 
#   Google Chrome
# author: Jeff Reeves

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
echo "[COMMAND] wmctrl -c \"- Chrome\""
echo "[COMMAND] wmctrl -c \"Google Hangouts\""
wmctrl -c "- Chromium"
wmctrl -c "- Chrome"
wmctrl -c "Google Hangouts"
