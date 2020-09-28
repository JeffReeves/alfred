#!/bin/bash
# purpose: outputs the current temperature in degrees Celsius
# author: Jeff Reeves

# get current temp from /sys
CPU_TEMP=$(</sys/class/thermal/thermal_zone0/temp)

# output in degrees Celsius
echo "$((CPU_TEMP/1000))C"