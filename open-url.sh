#!/bin/bash
# purpose: open a URL with the default browser
# author: Jeff Reeves

# get input from user
if [ -z ${1} ]; then 
   echo "[ERROR] No URL provided"
   echo "[HELP] Call this command with a quoted URL as a paramater"
   exit 1
fi

# set display
if [ -z "${DISPLAY}" ]; then
    export DISPLAY=':0.0'
fi

# set URL
URL="${1}"

# output URL
echo "[INFO] URL:"
echo "${URL}"

# open the URL
echo "[TASK] Opening URL in the default browser ..."
echo "[COMMAND] xdg-open \"${URL}\" || \
sensible-browser \"${URL}\" || \
x-www-browser \"${URL}\" || \
gnome-open \"${URL}\""

# run commands
xdg-open "${URL}" || \
sensible-browser "${URL}" || \
x-www-browser "${URL}" || \
gnome-open "${URL}"

