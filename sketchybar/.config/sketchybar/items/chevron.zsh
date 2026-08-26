#!/bin/zsh

ITEM_NAME="chevron"
ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  icon=""
  label.drawing=off
)
ITEM_SUBSCRIBES=()

sketchybar --add item "$ITEM_NAME" "$ITEM_POSITION"
sketchybar --set "$ITEM_NAME" "${ITEM_PROPERTIES[@]}"
sketchybar --subscribe "$ITEM_NAME" "${ITEM_SUBSCRIBES[@]}"
