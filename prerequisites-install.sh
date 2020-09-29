#!/bin/bash
# purpose: installs prerequisites to use other scripts
# author: Jeff Reeves

# TODO:
# - convert install to function with command passed as a parameter

# verify xdotool is installed
echo "[TASK] Verifing xdotool is installed ..."
XDOTOOL_PRESENT=$(which xdotool)
if [ -z "${XDOTOOL_PRESENT}" ]; then
    echo "[WARNING] xdotool command is not present"
    echo "[TASK] Installing xdotool..."
    echo "[COMMAND] sudo apt-get install xdotool -y"
    sudo apt-get install xdotool -y
else
    echo "[SUCCESS] xdotool is already installed:"
    echo "${XDOTOOL_PRESENT}"
fi

# verify wmctrl is installed
echo "[TASK] Verifing wmctrl is installed ..."
WMCTRL_PRESENT=$(which wmctrl)
if [ -z "${WMCTRL_PRESENT}" ]; then
    echo "[WARNING] wmctrl command is not present"
    echo "[TASK] Installing wmctrl..."
    echo "[COMMAND] sudo apt-get install wmctrl -y"
    sudo apt-get install wmctrl -y
else
    echo "[SUCCESS] wmctrl is already installed:"
    echo "${WMCTRL_PRESENT}"
fi

# # verify pcmanfm is installed
# echo "[TASK] Verifing pcmanfm is installed ..."
# PCMANFM_PRESENT=$(which pcmanfm)
# if [ -z "${PCMANFM_PRESENT}" ]; then
#     echo "[WARNING] pcmanfm command is not present"
#     echo "[TASK] Installing pcmanfm..."
#     echo "[COMMAND] sudo apt-get install pcmanfm -y"
#     sudo apt-get install pcmanfm -y
# else
#     echo "[SUCCESS] pcmanfm is already installed:"
#     echo "${PCMANFM_PRESENT}"
# fi