# config_file=$(cat ~/.config/hypr/keybinds.conf)
# config_file=${config_file/source = ~/}
# config_file=${config_file/source=~/}

# # ----------------------------------------------------- 
# # Path to keybindings config file
# # ----------------------------------------------------- 
# config_file="/home/$USER$config_file"
# echo "Reading from: $config_file"

# keybinds=""

# echo config_file

# # Detect Start String
# while read -r line
# do
#     if [[ "$line" == "bind"* ]]; then

#         line="$(echo "$line" | sed 's/$mainMod/SUPER/g')"
#         line="$(echo "$line" | sed 's/bind = //g')"
#         line="$(echo "$line" | sed 's/bindm = //g')"

#         IFS='#' 
#         read -a strarr <<<"$line" 
#         kb_str=${strarr[0]}
#         cm_str=${strarr[1]}

#         IFS=',' 
#         read -a kbarr <<<"$kb_str" 

#         item="${kbarr[0]}  + ${kbarr[1]}"$'\r'"${cm_str:1}"
#         keybinds=$keybinds$item$'\n'
#     fi 
# done < "$config_file"

# sleep 0.2
# rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds" -config ~/dotfiles/rofi/config-compact.rasi <<< "$keybinds"


#!/bin/bash

HYPR_CONF="$HOME/.config/hypr/hyprland.conf"

# extract the keybinding from hyprland.conf
mapfile -t BINDINGS < <(grep '^bind=' "$HYPR_CONF" | \
    sed -e 's/  */ /g' -e 's/bind=//g' -e 's/, /,/g' -e 's/ # /,/' | \
    awk -F, -v q="'" '{cmd=""; for(i=3;i<NF;i++) cmd=cmd $(i) " ";print "<b>"$1 " + " $2 "</b>  <i>" $NF ",</i><span color=" q "gray" q ">" cmd "</span>"}')

CHOICE=$(printf '%s\n' "${BINDINGS[@]}" | rofi -dmenu -i -markup-rows -p "Hyprland Keybinds:")

# extract cmd from span <span color='gray'>cmd</span>
CMD=$(echo "$CHOICE" | sed -n 's/.*<span color='\''gray'\''>\(.*\)<\/span>.*/\1/p')

# execute it if first word is exec else use hyprctl dispatch
if [[ $CMD == exec* ]]; then
    eval "$CMD"
else
    hyprctl dispatch "$CMD"
fi