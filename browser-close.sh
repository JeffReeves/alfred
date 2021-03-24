#!/bin/bash
# purpose: close any open running instances of:
#   - Microsoft Edge
#   - Chromium
#   - Google Chrome
#   - Firefox
#   - Google Hangouts
# author: Jeff Reeves

# close chrome gracefully
echo "[TASK] Closing Chromium/Chrome/Firefox gracefully..."
echo "[COMMAND] wmctrl -c \"- Microsoft​ Edge\""
echo "[COMMAND] wmctrl -c \"- Chromium\""
echo "[COMMAND] wmctrl -c \"- Google Chrome\""
echo "[COMMAND] wmctrl -c \"- Mozilla Firefox\""
echo "[COMMAND] wmctrl -c \"Google Hangouts\""
wmctrl -c "- Microsoft​ Edge" || \
wmctrl -c "- Chromium" || \
wmctrl -c "- Google Chrome" || \
wmctrl -c "- Mozilla Firefox" || \
wmctrl -c "Google Hangouts"

# verify return code was successful
if [ ${?} -eq 0 ]; then 
    echo '[SUCCESS] Browser closed successfully'
fi