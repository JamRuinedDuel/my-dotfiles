#!/bin/zsh

# Declare custom event: debug
sketchybar --add event debug

ITEM_NAME="debugger"
ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  icon="debug:"
  label=""
  script="$CONFIG_DIR/script/debug.zsh"
)
ITEM_SUBSCRIBES=(debug)

sketchybar --add item "$ITEM_NAME" "$ITEM_POSITION"
sketchybar --set "$ITEM_NAME" "${ITEM_PROPERTIES[@]}"
sketchybar --subscribe "$ITEM_NAME" "${ITEM_SUBSCRIBES[@]}"
