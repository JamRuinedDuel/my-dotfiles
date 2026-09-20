#!/bin/bash

DATE="$(date '+%H:%M:%S')"

sketchybar --set "$NAME" label="${MESSAGE:-$DATE}"
