#!/bin/sh

# Use brillo to logarithmically adjust laptop screen brightness
# and send a notification displaying the current brightness level after.

send_notification() {
	brightness=$(printf "%.0f\n" "$(brillo -G)")
	dunstify -a "changebrightness" -u low -r 9993 -h int:value:"$brightness" -i "brightness" "Brightness" "Currently at $brightness%" -t 500
}

case $1 in
up)
	brillo -A 2 -q
	send_notification "$1"
	;;
down)
	brillo -U 2 -q
	send_notification "$1"
	;;
esac