#!/bin/env bash

choice=$(printf "󱐋  Perfomance\n  Balanced\n󰒲  Power-Saver" | rofi -dmenu)

case "$choice" in
  "󱐋  Perfomance") pkexec tlp ac ;;
  "  Balanced") pkexec tlp bat;;
  "󰒲  Power-Saver") pkexec tlp power-saver ;;
esac
