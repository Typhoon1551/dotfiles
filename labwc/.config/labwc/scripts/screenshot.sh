#!/usr/bin/env bash
set -euo pipefail

mode="${1:-full}"
dir="$HOME/Pictures/Screenshots"
file="$dir/Screenshot from $(date +'%Y-%m-%d %H-%M-%S').png"

mkdir -p "$dir"

if [ "$mode" = "region" ]; then
  geometry=$(slurp) || exit 0
  grim -g "$geometry" "$file"
else
  grim "$file"
fi

wl-copy < "$file"
notify-send "Screenshot saved" "$file" -i "$file"
