#!/bin/bash
# purpose: wake me up in the morning
# author: Jeff Reeves

# TODO:
# - create a homepage to load helpful information when waking:
#   examples: weather, date, reminders, nice messages

# wake the screen
${HOME}/alfred/wake-screen.sh

# open a browser with a relaxing video
# TODO:
# - add array and load one from random
${HOME}/alfred/open-url.sh 'https://www.youtube.com/watch?v=IvjMgVS6kng&t=1'
