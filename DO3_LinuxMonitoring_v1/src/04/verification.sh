#!/bin/bash

if { [[ -n "$column1_background" ]] && ! [[ "$column1_background" =~ ^[1-6]$ ]]; } ||
	{ [[ -n "$column1_font_color" ]] && ! [[ "$column1_font_color" =~ ^[1-6]$ ]]; } ||
	{ [[ -n "$column2_background" ]] && ! [[ "$column2_background" =~ ^[1-6]$ ]]; } ||
	{ [[ -n "$column2_font_color" ]] && ! [[ "$column2_font_color" =~ ^[1-6]$ ]]; }; then
	echo "Error: Parameter color must be a number between 1 and 6."
	echo "Available colors: 1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black"
	echo ""
	echo "Please edit the config.conf file"
	exit 1
fi

if [ "$column1_background" -eq "$column1_font_color" ] || [ "$column2_background" -eq "$column2_font_color" ]; then
	echo "Error: Font and background colors of one column must not match."
	echo ""
	echo "Please edit the config.conf file"
	exit 1
fi
