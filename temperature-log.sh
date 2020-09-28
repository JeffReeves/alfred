#!/bin/bash
# purpose: display and log temperature with CPU load averages on Raspberry Pi 4
# author: Jeff Reeves

# TODO:
# - add user input for delay in seconds
# - add current date/time to output
# - add user prompt to press ^+c to cancel/stop output

# set delay
DELAY=60

# start log
echo "[TASK] Logging CPU temp and load averages every ${DELAY} seconds ..."
echo "[START] $(date)" | tee /tmp/temp.log

# output header
printf "%-6s %-6s %-6s %-6s %-s\n" \
       "TEMP" "ONE" "FIVE" "FIFTEEN" "(UPTIME)" | \
       tee -a /tmp/temp.log

# loop endlessly
while true; do

    # get CPU temp
    CPU_TEMP=$(</sys/class/thermal/thermal_zone0/temp)
    TEMP="$((CPU_TEMP/1000))C" # formatted to degrees Celsius
    
    # get load average
    LOAD_AVERAGE=$(cat /proc/loadavg | cut -d' ' -f1-3)
    ONE=$(echo "${LOAD_AVERAGE}" | awk '{ print $1 }')
    FIVE=$(echo "${LOAD_AVERAGE}" | awk '{ print $2 }')
    FIFTEEN=$(echo "${LOAD_AVERAGE}" | awk '{ print $3 }')

    # output values to screen and append to log file
    printf "%-6s %-6s %-6s %-6s\n" \
	   "${TEMP}" "${ONE}" "${FIVE}" "${FIFTEEN}" | \
	   tee -a /tmp/temp.log

    # wait for delay time
    sleep ${DELAY}
done
