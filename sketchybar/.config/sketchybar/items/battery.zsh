#!/bin/zsh

ITEM_NAME="battery"
ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  update_freq=120
  script="$CONFIG_DIR/script/battery.zsh"
)
ITEM_SUBSCRIBES=(system_woke power_source_change)

sketchybar --add item "$ITEM_NAME" "$ITEM_POSITION"
sketchybar --set "$ITEM_NAME" "${ITEM_PROPERTIES[@]}"
sketchybar --subscribe "$ITEM_NAME" "${ITEM_SUBSCRIBES[@]}"
