#!/bin/bash
# purpose: Manually installs a Gnome extension for a user
# author: Jeff Reeves


# get extension zip file name from parameter 
if [ -z "${1}" ]; then
    read -p "[PROMPT] Enter a path to the Gnome extension's zip file " ZIP_FILE
else
    ZIP_FILE="${1}"
fi


# verify zip file is a full path
if [[ ! "${ZIP_FILE}" =~ '^/.*' ]]; then
    echo "[WARNING] Zip file provided is not a full path"
    echo "[TASK] Getting zip file's full path ..."
    echo "[COMMAND] find \"${HOME}\" -type f -name \"${ZIP_FILE}\" | head -n1"
    ZIP_FILE=$(find "${HOME}" -type f -name "${ZIP_FILE}" | head -n1)
    RETURN_CODE=$?
fi

if [ ${RETURN_CODE} -ne 0 ]; then 
    echo "[ERROR] Unable to get full path to zip file"
    echo "[HELP] Verify zip file exists and is within the user's home directory"
    exit 1
else
    echo "[INFO] Zip file's full path: "
    echo "${ZIP_FILE}"
fi


# get extension UUID
echo "[TASK] Getting extension UUID ..."
echo "[COMMAND] unzip -c \"${ZIP_FILE}\" metadata.json | grep -i 'uuid' | cut -d\\\" -f4"
EXTENSION_UUID=$(unzip -c "${ZIP_FILE}" metadata.json | grep -i 'uuid' | cut -d\" -f4)

if [ -z "${EXTENSION_UUID}" ]; then
    echo "[ERROR] Unable to acquire extension UUID"
    echo "[HELP] Verify that a metadata.json file exists within the .zip archive"
    exit 2
else 
    echo "[INFO] Extension UUID: ${EXTENSION_UUID}"
fi


# create directory to store extension for user
echo "[TASK] Creating directory for extension ..."
echo "[COMMAND] mkdir -p \"${HOME}/.local/share/gnome-shell/extensions/${EXTENSION_UUID}\""
mkdir -p "${HOME}/.local/share/gnome-shell/extensions/${EXTENSION_UUID}"
RETURN_CODE=$?

if [ ${RETURN_CODE} -ne 0 ]; then 
    echo "[ERROR] Unable to create directory"
    echo "[HELP] Verify ownership and permissions to create this directory"
    exit 3
else
    echo "[SUCCESS] Extension directory created"
fi


#  unzip extension into directory
echo "[TASK] Unzipping extension ..."
echo "[COMMAND] unzip -q \"${ZIP_FILE}\" -d \"${HOME}/.local/share/gnome-shell/extensions/${EXTENSION_UUID}/\""
unzip -q "${ZIP_FILE}" -d "${HOME}/.local/share/gnome-shell/extensions/${EXTENSION_UUID}/"
RETURN_CODE=$?

if [ ${RETURN_CODE} -ne 0 ]; then 
    echo "[ERROR] Unable to unzip extension into .local directory"
    echo "[HELP] Verify ownership and permissions to extract into this directory"
    exit 4
else 
    echo "[SUCCESS] Extension extracted into .local directory"
fi


# enable the extension
echo "[TASK] Enabling extension ..."
echo "[COMMAND] gnome-shell-extension-tool -e \"${EXTENSION_UUID}\""
gnome-shell-extension-tool -e "${EXTENSION_UUID}"
RETURN_CODE=$?

if [ ${RETURN_CODE} -ne 0 ]; then 
    echo "[ERROR] Unable to enable extension"
    echo "[HELP] Press Alt+F2, type 'r', and press Enter."
    echo "[HELP] Open Gnome Tweaks and enable plugin manually."
    exit 5
else 
    echo "[SUCCESS] Extension enabled"
    echo "[PROMPT] Restart Gnome - Press Alt+F2, type 'r', and press Enter"
fi