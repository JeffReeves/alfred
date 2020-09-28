#!/bin/bash
# purpose: waits for X amount of minutes
# author: Jeff Reeves

# if $1 was not passed, prompt for valid input
if [ -z ${1} ]; then
    read -p "[PROMPT] Enter the number of minutes to wait: " WAIT_MINUTES
else
    WAIT_MINUTES=${1}
fi

# convert minutes to seconds
WAIT_SECONDS=$(($WAIT_MINUTES*60))
WAIT_DATE=$(date --date="${WAIT_SECONDS} seconds")
#echo "[INFO] Current Date and Time: $(date)"
echo "[INFO] Waiting ${WAIT_MINUTES} minutes:"
echo "    ${WAIT_DATE}"
echo "[HELP] To cancel: press Ctrl+C or simply close this window."

# make sure we have waited long enough
if [ ! -z ${WAIT_SECONDS} ]; then
    sleep ${WAIT_SECONDS}
    echo "[SUCCESS] Wait complete"
fi