#!/bin/bash

column1_background_default=6
column1_font_color_default=1
column2_background_default=6
column2_font_color_default=4

color_names=("white" "red" "green" "blue" "purple" "black")

config_file="config.conf"

if [ -f "$config_file" ]; then
	source "$config_file"
fi

if [[ -z "$column1_background" ]]; then
	column1_background=${column1_background_default}
	info_column1_background="default (${color_names[$((column1_background - 1))]})"
else
	info_column1_background="${column1_background} (${color_names[$((column1_background - 1))]})"
fi

if [[ -z "$column1_font_color" ]]; then
	column1_font_color=${column1_font_color_default}
	info_column1_font_color="default (${color_names[$((column1_font_color - 1))]})"
else
	info_column1_font_color="${column1_font_color} (${color_names[$((column1_font_color - 1))]})"
fi

if [[ -z "$column2_background" ]]; then
	column2_background=${column2_background_default}
	info_column2_background="default (${color_names[$((column2_background - 1))]})"
else
	info_column2_background="${column2_background} (${color_names[$((column2_background - 1))]})"
fi

if [[ -z "$column2_font_color" ]]; then
	column2_font_color=${column2_font_color_default}
	info_column2_font_color="default (${color_names[$((column2_font_color - 1))]})"
else
	info_column2_font_color="${column2_font_color} (${color_names[$((column2_font_color - 1))]})"
fi
