#!/bin/zsh

sketchybar --add event aerospace_workspace_change

ITEM_POSITION="$1"
ITEM_PROPERTIES=(
  background.padding_left=0
  background.padding_right=10
  background.corner_radius=5
  background.height=20
  drawing=off
  icon.padding_left=10
  icon.padding_right=5
  label.padding_left=5
  label.padding_right=10
)
ITEM_SUBSCRIBES=(aerospace_workspace_change)

for i in {1..9}; do
  sketchybar --add item "space.$i" "$ITEM_POSITION"
  sketchybar --set "space.$i" "${ITEM_PROPERTIES[@]}"
  sketchybar --set "space.$i" icon="$i"
  sketchybar --set "space.$i" script="$CONFIG_DIR/script/aerospace.zsh $i"
  sketchybar --set "space.$i" click_script="aerospace workspace $i"
  sketchybar --subscribe "space.$i" "${ITEM_SUBSCRIBES[@]}"
done
