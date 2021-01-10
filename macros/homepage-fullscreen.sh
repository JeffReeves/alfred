#!/bin/bash
# purpose: opens my personal homepage (currently a clock)
# author: Jeff Reeves

# open the homepage URL for the night clock
~/alfred/browser-open.sh 'file:///home/jeff/homepage/index.html'

# wait 5 seconds to ensure the page is open
sleep 5

# send F11 to fullscreen the homepage
~/alfred/browser-fullscreen.sh 'Homepage'
