#!/bin/bash

source ./config_parsing.sh
source ./verification.sh
source ./utils.sh

print_colored() {
	local bg_color=('47' '41' '42' '44' '45' '40')
	local font_color=('97' '91' '92' '94' '95' '90')
	local bg_color_left=${bg_color[column1_background - 1]}
	local font_color_left=${font_color[column1_font_color - 1]}
	local bg_color_right=${bg_color[column2_background - 1]}
	local font_color_right=${font_color[column2_font_color - 1]}
	local text_left=$5
	local text_right=$6

	echo -e "\e[${bg_color_left};${font_color_left}m${text_left}\e[0m = \e[${bg_color_right};${font_color_right}m${text_right}\e[0m"
}

print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "HOSTNAME" "$HOSTNAME"
print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "TIMEZONE" "$TIMEZONE"
print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "USER" "$USER"
print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "OS" "$OS"
print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "DATE" "$DATE"
print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "UPTIME" "$UPTIME"
print_colored "$column1_background" "$column1_font_color" "$column1_background" "$column1_font_color" "UPTIME_SEC" "$UPTIME_SEC"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "IP" "$IP"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "MASK" "$MASK"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "GATEWAY" "$GATEWAY"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "RAM_TOTAL" "$RAM_TOTAL"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "RAM_USED" "$RAM_USED"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "RAM_FREE" "$RAM_FREE"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "SPACE_ROOT" "$SPACE_ROOT"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
print_colored "$column2_background" "$column2_font_color" "$column2_background" "$column2_font_color" "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"

source ./column_info.sh
