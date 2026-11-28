#!/usr/bin/env bash
# Morning briefing on an Echo: greeting with the date, weather, today's calendar
# and the Flash Briefing. Run by hand or from cron, e.g.:
#   30 7 * * * $HOME/path/to/morning_briefing.sh >> $HOME/alexa-briefing.log 2>&1
# Usage: morning_briefing.sh ["Echo Dot"] ["Name"]
set -u
DEV="${1:-Echo Dot}"
NAME="${2:-there}"
CLI="$(command -v cli-anything-alexa || echo /Library/Frameworks/Python.framework/Versions/3.13/bin/cli-anything-alexa)"
"$CLI" speak "$DEV" "Good morning $NAME! Here is your briefing for $(date '+%A, %d %B')."
sleep 8
"$CLI" sequence "$DEV" weather
sleep 30
"$CLI" sequence "$DEV" calendar-today
sleep 25
"$CLI" sequence "$DEV" flash-briefing
