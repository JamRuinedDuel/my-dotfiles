#!/bin/zsh

ITEM_NAME="volume"
ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  script="$CONFIG_DIR/script/volume.zsh"
)
ITEM_SUBSCRIBES=(volume_change)

sketchybar --add item "$ITEM_NAME" "$ITEM_POSITION"
sketchybar --set "$ITEM_NAME" "${ITEM_PROPERTIES[@]}"
sketchybar --subscribe "$ITEM_NAME" "${ITEM_SUBSCRIBES[@]}"
