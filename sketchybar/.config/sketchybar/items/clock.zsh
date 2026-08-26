#!/bin/zsh

ITEM_NAME="clock"
ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  update_freq=10
  script="$CONFIG_DIR/script/clock.zsh"
)
ITEM_SUBSCRIBES=()

sketchybar --add item "$ITEM_NAME" "$ITEM_POSITION"
sketchybar --set "$ITEM_NAME" "${ITEM_PROPERTIES[@]}"
sketchybar --subscribe "$ITEM_NAME" "${ITEM_SUBSCRIBES[@]}"
