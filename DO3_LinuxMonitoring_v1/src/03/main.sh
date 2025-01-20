#!/bin/bash

source ./verification.sh
source ./utils.sh

print_colored() {
	local bg_color=('47' '41' '42' '44' '45' '40')
	local font_color=('97' '91' '92' '94' '95' '90')
	local bg_color_left=${bg_color[$1 - 1]}
	local font_color_left=${font_color[$2 - 1]}
	local bg_color_right=${bg_color[$3 - 1]}
	local font_color_right=${font_color[$4 - 1]}
	local text_left=$5
	local text_right=$6

	echo -e "\e[${bg_color_left};${font_color_left}m${text_left}\e[0m = \e[${bg_color_right};${font_color_right}m${text_right}\e[0m"
}

print_colored "$1" "$2" "$3" "$4" "HOSTNAME" "$HOSTNAME"
print_colored "$1" "$2" "$3" "$4" "TIMEZONE" "$TIMEZONE"
print_colored "$1" "$2" "$3" "$4" "USER" "$USER"
print_colored "$1" "$2" "$3" "$4" "OS" "$OS"
print_colored "$1" "$2" "$3" "$4" "DATE" "$DATE"
print_colored "$1" "$2" "$3" "$4" "UPTIME" "$UPTIME"
print_colored "$1" "$2" "$3" "$4" "UPTIME_SEC" "$UPTIME_SEC"
print_colored "$1" "$2" "$3" "$4" "IP" "$IP"
print_colored "$1" "$2" "$3" "$4" "MASK" "$MASK"
print_colored "$1" "$2" "$3" "$4" "GATEWAY" "$GATEWAY"
print_colored "$1" "$2" "$3" "$4" "RAM_TOTAL" "$RAM_TOTAL"
print_colored "$1" "$2" "$3" "$4" "RAM_USED" "$RAM_USED"
print_colored "$1" "$2" "$3" "$4" "RAM_FREE" "$RAM_FREE"
print_colored "$1" "$2" "$3" "$4" "SPACE_ROOT" "$SPACE_ROOT"
print_colored "$1" "$2" "$3" "$4" "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
print_colored "$1" "$2" "$3" "$4" "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"
