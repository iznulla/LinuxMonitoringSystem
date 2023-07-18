#!/bin/bash

. ./ram_info.sh
. ./rootspacs.sh

logdt=$(date '+%d_%m_%y_%H_%M_%S')
times=$(timedatectl | grep zone | sed 's/Time zone://g' | 
sed 's/ //g')
OS=$(lsb_release -d)
DATE=$(date | sed 's/Thu //')
ipint=$(ip a | awk '/inet /{print $2}' | sed '1d')
mask=$(ipcalc ${ipint:(-2)} | awk '/Netmask:/{print $2}')
gateway=$(ip route | grep defaul | awk '/via /{print $3}')

echo "HOSTNAME=$(cat /etc/hostname)" >> "$logdt".status
echo "TIMEZONE=${times}"  >> "$logdt".status
echo "USER=$USER" >> "$logdt".status
echo "OS=${OS:13}" >> "$logdt".status
echo "DATE=$DATE" >> "$logdt".status
echo "UPTIME=$(uptime -p | sed 's/up //g')" >> "$logdt".status
echo "UPTIME_SEC=$(cat /proc/uptime)" >> "$logdt".status
echo "IP=$ipint" >> "$logdt".status
echo "MASK=$mask" >> "$logdt".status
echo "GATEWAY=$gateway" >> "$logdt".status
echo "RAM_TOTAL=$ramtrounded" >> "$logdt".status
echo "RAM_USED=$ramusrounded" >> "$logdt".status
echo "RAM_FREE=$ramfreerounded" >> "$logdt".status
echo "SPACE_ROOT=$roototrounded" >> "$logdt".status
echo "SPACE_ROOT_USED=$rootusedrounded" >> "$logdt".status
echo "SPACE_ROOT_FREE=$rootfreerounded" >> "$logdt".status

echo "$(cat "$logdt".status)"

read save
if [[ "${save^^}" = "Y" ]];
then
echo "Log file created"
else
rm "$logdt".status
echo "Log not saved"
fi
