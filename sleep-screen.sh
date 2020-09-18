#!/bin/bash
# purpose: puts screen into standby mode after X amount of minutes
# author: Jeff Reeves

# if $1 was not passed, prompt for valid input
if [ -z ${1} ]; then
    read -p "[PROMPT] Enter the number of minutes before sleep: " SLEEP_MINUTES
else
    SLEEP_MINUTES=${1}
fi

# convert minutes to seconds
SLEEP_SECONDS=$(($SLEEP_MINUTES*60))
SLEEP_DATE=$(date --date="${SLEEP_SECONDS} seconds")
#echo "[INFO] Current Date and Time: $(date)"
echo "[INFO] Screen will go to sleep in ${SLEEP_MINUTES} minutes:"
echo "    ${SLEEP_DATE}"
echo "[HELP] To cancel: press Ctrl+C or simply close this window."

# make sure we have waited long enough
if [ ! -z ${SLEEP_SECONDS} ]; then
    sleep ${SLEEP_SECONDS}

    # minimize the current window (reduces CPU load)
    echo "[TASK] Minimize current window (reduces CPU load) ..."
    # TODO:
    # - updated minimize to all windows that are important, not just active
    # xdotool search --onlyvisible --class 'chrome|chromium|terminal'
    echo "[COMMAND] xdotool getactivewindow windowminimize"
    xdotool getactivewindow windowminimize

    # put screen to sleep/blank
    echo "[TASK] Put screen to sleep/blank ..."
    echo "[COMMAND] xset dpms force standby"
    xset dpms force standby

    if [ $? -eq 0 ]; then
        echo "[SUCCESS] Screen is now asleep"
    fi
fi
