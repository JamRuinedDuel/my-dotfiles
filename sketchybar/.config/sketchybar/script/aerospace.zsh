#!/bin/zsh

SPACE_ID="${1:-${NAME#space.}}"
CURRENT_FOCUS="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
# SPACE_ID="$1"
# CURRENT_FOCUS="$FOCUSED_WORKSPACE"

# --- DYNAMIC MONITOR MAP LOOKUP ---
# Grabs all workspace-to-monitor bindings in a single string instantly
monitor_map=$(aerospace list-workspaces --all --format '%{workspace} %{monitor-appkit-nsscreen-screens-id}')

# Extract the monitor ID specific to this SPACE_ID using a fast regex pattern match
# Look for a line starting with our SPACE_ID followed by a space, then grabs the monitor number
CURRENT_MONITOR=$(echo "$monitor_map" | grep "^$SPACE_ID " | awk '{print $2}')

if [ -n "$CURRENT_MONITOR" ]; then
  sketchybar --set "$NAME" display="$CURRENT_MONITOR"
fi

# Check if this is the focused workspace
if [ "$SPACE_ID" = "$CURRENT_FOCUS" ]; then
  sketchybar --set "$NAME" background.color=0xff21262d
else
  sketchybar --set "$NAME" background.color=0x7721262d
fi

# Check if this is an active workspace
workspaces_active=($(aerospace list-workspaces --all))

if (( ${workspaces_active[(i)$SPACE_ID]} <= ${#workspaces_active} )); then
  sketchybar --set "$NAME" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi

# Set label as application name in the workspace
apps_list=$(aerospace list-windows --workspace $SPACE_ID --format '%{app-name}' | sort -u | awk 'NF {if (lines) lines=lines" • "$0; else lines=$0} END {print lines}')
sketchybar --set "$NAME" label="$apps_list"
