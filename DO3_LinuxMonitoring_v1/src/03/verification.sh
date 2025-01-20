#!/bin/bash

if [ $# -ne 4 ]; then
	echo "Error: Invalid number of parameters. Please provide exactly 4 parameters."
	echo "Usage: $0 <background_color> <text_color> <value_background_color> <value_text_color>"
	echo "Available colors:"
	echo "1 - white"
	echo "2 - red"
	echo "3 - green"
	echo "4 - blue"
	echo "5 - purple"
	echo "6 - black"
	exit 1
fi

for param in "$@"; do
	if ! [[ "$param" =~ ^[1-6]$ ]]; then
		echo "Error: All parameters must be integers between 1 and 6."
		echo "Usage: $0 <background_color> <text_color> <value_background_color> <value_text_color>"

		echo "Available colors:"
		echo "1 - white"
		echo "2 - red"
		echo "3 - green"
		echo "4 - blue"
		echo "5 - purple"
		echo "6 - black"
		exit 1
	fi
done

if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
	echo "Error: Font and background colors of one column must not match."
	echo "Please re-run the script with different background and text colors."
	echo "Usage: $0 <background_color> <text_color> <value_background_color> <value_text_color>"

	echo "Available colors:"
	echo "1 - white"
	echo "2 - red"
	echo "3 - green"
	echo "4 - blue"
	echo "5 - purple"
	echo "6 - black"
	exit 1
fi
