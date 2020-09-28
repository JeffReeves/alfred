#!/bin/bash
# purpose: close any open running instances of:
#   - Chromium
#   - Google Chrome
#   - Firefox
#   - Google Hangouts
# author: Jeff Reeves

# close chrome gracefully
echo "[TASK] Closing Chromium/Chrome gracefully..."
echo "[COMMAND] wmctrl -c \"- Chromium\""
echo "[COMMAND] wmctrl -c \"- Google Chrome\""
echo "[COMMAND] wmctrl -c \"- Mozilla Firefox\""
echo "[COMMAND] wmctrl -c \"Google Hangouts\""
wmctrl -c "- Chromium"
wmctrl -c "- Google Chrome"
wmctrl -c "- Mozilla Firefox"
wmctrl -c "Google Hangouts"