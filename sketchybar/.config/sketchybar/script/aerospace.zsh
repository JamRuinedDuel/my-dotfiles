#!/bin/zsh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" background.drawing=on
else
  sketchybar --set "$NAME" background.drawing=off
fi

workspace_active=($(aerospace list-workspaces --all))

if (( ${workspace_active[(i)$1]} <= ${#workspace_active} )); then
  sketchybar --set "$NAME" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi
