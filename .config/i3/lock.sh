#!/usr/bin/env bash

icon="$HOME/.config/i3/lock_icon_6.png"
tmpbg='/tmp/screen.png'

#(( $# )) && { icon=$1; }

scrot "$tmpbg"

# WHILE WAITING FOR JOB:
i3lock -e -u -i "$tmpbg"

#convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" -blur 0x8 "$tmpbg"
gm convert "$tmpbg" -filter Gaussian -scale 5% -scale 2000% "$tmpbg"
#gm convert "$tmpbg" -filter Gaussian -scale 2% -scale 5000% "$tmpbg"

## PUT TOGETHER IMAGES
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg" # Used with one monitor only
#gm composite "$icon" "$tmpbg" -gravity center -matte "$tmpbg" # Used with one monitor only
gm composite "$icon" "$tmpbg" -gravity center "$tmpbg" # Used with one monitor only

kill $(pgrep i3lock)
i3lock  -e -u -i "$tmpbg" #&& systemctl suspend
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
## instead of dbus-send use playerctl
rm /tmp/screen.png
