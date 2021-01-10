#!/bin/bash
# purpose: closes chrome or firefox browsers after waiting minutes
# author: Jeff Reeves

# get number of minutes to wait from the first parameter
if [ -z ${1} ]; then
    echo "[ERROR] Number of minutes not passed as a parameter"
    echo "[HELP] Please re-run this command with a value (in minutes)"
    exit 1
else
    MINUTES_TO_WAIT=${1}
fi

# wait for number of minutes
~/alfred/wait.sh ${MINUTES_TO_WAIT}

# close chromium/chrome/firefox
~/alfred/browser-close.sh

# wait 5 seconds to ensure chromium is closed
sleep 5