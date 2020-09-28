#!/bin/bash
# purpose: closes chrome and opens night clock
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

# open the homepage URL for the night clock
~/alfred/browser-open.sh 'file:///home/jeff/homepage/index.html'

# wait 5 seconds to ensure the page is open
sleep 5

# send F11 to fullscreen the homepage
~/alfred/browser-fullscreen.sh 'Homepage'
