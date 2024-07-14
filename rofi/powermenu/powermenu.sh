# Current Theme
dir="$HOME/.config/rofi/powermenu/"
theme='style'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`uname -n`

# Options
shutdown=󰐥
reboot=󰑐
lock=
suspend=
logout=󰁔
yes=' Yes'
no='No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# # Confirmation CMD
# confirm_cmd() {
# 	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
# 		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
# 		-theme-str 'listview {columns: 2; lines: 1;}' \
# 		-theme-str 'element-text {horizontal-align: 0.5;}' \
# 		-theme-str 'textbox {horizontal-align: 0.5;}' \
# 		-dmenu \
# 		-p 'Confirmation' \
# 		-mesg 'Are you Sure?' \
# 		-theme ${dir}/${theme}.rasi
# }

# # Ask for confirmation
# confirm_exit() {
# 	echo -e "$yes\n$no" | confirm_cmd
# }

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}


# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		sytemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		swaylock
		;;
    $suspend)
		systemctl suspend
        ;;
    $logout)
		systemctl enable --now sddm
        ;;
esac
