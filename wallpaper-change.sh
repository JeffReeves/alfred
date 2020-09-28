#!/bin/bash
# purpose: Changes wallpapers to a random one within a user defined directory
# author: Jeff Reeves

# globals
# file to store list of random wallpapers
WALLPAPERS_FILE='/tmp/wallpapers.txt'

# set a default user for cron (based on UID 1000)
if [ -z "${USER}" ]; then
    export USER=$(id -un 1000)
fi


# functions
function generate_wallpapers_list(){

    # default wallpaper directory
    WALLPAPER_DIRECTORY="/home/${USER}/Pictures/wallpapers"

    # accept user input for wallpaper directory
    if [ ! -z ${1} ]; then
        WALLPAPER_DIRECTORY="${1}"
    fi

    # get a list of all image files within the wallpaper directory
    IMAGE_FILES=$(find "${WALLPAPER_DIRECTORY}" -type f -iregex '.*\.\(png\|jpg\|jpeg\|bmp\)')

    # verify we have images
    if [ -z "${IMAGE_FILES}" ]; then 
        echo "[ERROR] No image files found within ${WALLPAPER_DIRECTORY}"
        echo "[HELP] Verify a .png/.jpg/.jpeg/.bmp file exists"
        exit 1
    fi

    # generate a shuffled list of the images
    SHUFFLED_IMAGES=$(echo "${IMAGE_FILES}" | shuf)

    # store shuffled images list in a temp file
    echo "${SHUFFLED_IMAGES}" > /tmp/wallpapers.txt
}

function get_next_wallpaper(){

    # if wallpapers list file doesn't exist or is empty
    if [ ! -s "${WALLPAPERS_FILE}" ]; then
        generate_wallpapers_list "${1}"
    fi

    # read first line of wallpaper file
    LINE=$(head -n1 "${WALLPAPERS_FILE}")

    # verify the line has a value
    if [ -z "${LINE}" ]; then
        echo "[ERROR] First line of ${WALLPAPERS_FILE} was empty"
	echo "[HELP] Regenerate wallpapers list file"
	exit 2
    fi

    # delete line from file
    grep -v "${LINE}" "${WALLPAPERS_FILE}" > "${WALLPAPERS_FILE}.new" && \
    mv "${WALLPAPERS_FILE}.new" "${WALLPAPERS_FILE}"

    # return a full path to a single wallpaper
    echo "${LINE}"
}

function change_wallpaper(){
    
    # set display, if not already set
    if [ -z "${DISPLAY}" ]; then
        export DISPLAY=':0.0'
    fi
  
    # export runtime directory 
    export XDG_RUNTIME_DIR=/run/user/$(id -u "${USER}")

    # change wallpaper
    echo "[DEBUG $(date)] pcmanfm --set-wallpaper \"${1}\" --display \"${DISPLAY}\""
    pcmanfm --set-wallpaper "${1}" --display "${DISPLAY}"
}


# MAIN
IMAGE=$(get_next_wallpaper)
change_wallpaper "${IMAGE}"