#!/bin/zsh

ITEM_NAME="front_app"
ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  icon.drawing=off
  script="$CONFIG_DIR/script/front_app.zsh"
)
ITEM_SUBSCRIBES=(front_app_switched)

sketchybar --add item "$ITEM_NAME" "$ITEM_POSITION"
sketchybar --set "$ITEM_NAME" "${ITEM_PROPERTIES[@]}"
sketchybar --subscribe "$ITEM_NAME" "${ITEM_SUBSCRIBES[@]}"
