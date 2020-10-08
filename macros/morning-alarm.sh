#!/bin/bash
# purpose: wake me up in the morning
# author: Jeff Reeves

# TODO:
# - create a homepage to load helpful information when waking:
#   examples: weather, date, reminders, nice messages

# wake the screen
${HOME}/alfred/screen-wake.sh

# open a browser with a relaxing video
# TODO:
# - add array and load one from random
${HOME}/alfred/browser-open.sh 'https://www.youtube.com/watch?v=IvjMgVS6kng&t=1'

# wait 10 seconds for browser and video to fully load
sleep 10

# fullscreen the browser and YouTube video
#${HOME}/alfred/browser-fullscreen.sh 'Relaxing River Sounds - Peaceful Forest River'

# switch to home page tab on first tab
${HOME}/alfred/browser-tab-select.sh '1'