#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Error: No parameter provided."
	echo "Usage: $0 <string>"
	exit 1
fi

if [ $# -gt 1 ]; then
	echo "Error: Too many parameters provided. Please provide only one."
	echo "Usage: $0 <string>"
	exit 1
fi

param="$1"

if [[ "$param" =~ ^[0-9]+$ ]]; then
	echo "Error: Invalid input. The parameter is a number."
	echo "Usage: $0 <string>"
	exit 1
fi

echo "$param"
