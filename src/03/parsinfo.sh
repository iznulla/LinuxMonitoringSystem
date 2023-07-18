#!/bin/bash
. ./ram_info.sh
. ./rootspacs.sh
. ./clrconfig.sh

colors=("white" "white" "red" "green" "blue" "purple" "black")
column1_bg=("\033[47m" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")
column1_fc=("\033[37m" "\033[37m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m")
column2_bg=("\033[47m" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")
column2_fc=("\033[37m" "\033[37m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m")

if [ -n "$column1_background" ]
then
    bg1=${column1_bg[$column1_background]}
else
    bg1=${column1_bg[default_column1_background]}
fi
if [ -n "$column1_font_color" ]
then
    fc1=${column1_fc[$column1_font_color]}
else
    fc1=${column1_fc[default_column1_font_color]}
fi
if [ -n "$column2_background" ]
then
    bg2=${column2_bg[$column2_background]}
else
    bg2=${column2_bg[default_column2_background]}
fi
if [ -n "$column2_font_color" ]
then
    fc2=${column2_fc[$column2_font_color]}
else
    fc2=${column2_fc[default_column2_font_color]}
fi

# bg1=${column1_bg[$column1_font_color]}
# fc1=${column1_fc[$column1_font_color]}
# bg2=${column2_bg[$column2_background]}
# fc2=${column2_fc[$column2_font_color]}


logdt=$(date '+%d_%m_%y_%H_%M_%S')
times=$(timedatectl | grep zone | sed 's/Time zone://g' |
sed 's/ //g')
OS=$(lsb_release -d)
DATE=$(date | sed 's/Thu //')
ipint=$(ip a | awk '/inet /{print $2}' | sed '1d')
mask=$(ipcalc ${ipint:(-2)} | awk '/Netmask:/{print $2}')
gateway=$(ip route | grep defaul | awk '/via /{print $3}')

echo -e "$bg1${fc1}HOSTNAME=$bg2$fc2$(cat /etc/hostname)"
echo -e "$bg1${fc1}TIMEZONE=$bg2$fc2${times}"
echo -e "$bg1${fc1}USER=$bg2$fc2$USER"
echo -e "$bg1${fc1}OS=$bg2$fc2${OS:13}"
echo -e "$bg1${fc1}DATE=$bg2$fc2$DATE"
echo -e "$bg1${fc1}UPTIME=$bg2$fc2$(uptime -p | sed 's/up //g')"
echo -e "$bg1${fc1}UPTIME_SEC=$bg2$fc2$(cat /proc/uptime)"
echo -e "$bg1${fc1}IP=$bg2$fc2$ipint"
echo -e "$bg1${fc1}MASK=$bg2$fc2$mask"
echo -e "$bg1${fc1}GATEWAY=$bg2$fc2$gateway"
echo -e "$bg1${fc1}RAM_TOTAL=$bg2$fc2$ramtrounded"
echo -e "$bg1${fc1}RAM_USED=$bg2$fc2$ramusrounded"
echo -e "$bg1${fc1}RAM_FREE=$bg2$fc2$ramfreerounded"
echo -e "$bg1${fc1}SPACE_ROOT=$bg2$fc2$roototrounded"
echo -e "$bg1${fc1}SPACE_ROOT_USED=$bg2$fc2$rootusedrounded"
echo -e "$bg1${fc1}SPACE_ROOT_FREE=$bg2$fc2$rootfreerounded"

