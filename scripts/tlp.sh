#!/bin/env bash

choice=$(printf "󱐋  Perfomance\n  Balanced\n󰒲  Power-Saver" | rofi -dmenu)

case "$choice" in
  "󱐋  Perfomance") powerprofilesctl set performance && notify-send.sh "
	  $(powerprofilesctl get) was set
	  ";;
  "  Balanced") powerprofilesctl set balanced && notify-send.sh "
	  $(powerprofilesctl get) was set
	  ";;
  "󰒲  Power-Saver") powerprofilesctl set power-saver && notify-send.sh "
	  $(powerprofilesctl get) was set
	  ";;
esac
