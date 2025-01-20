#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Error: Directory path argument required."
	echo "Usage: $0 <directory_path/>"
	exit 1
fi

if [ $# -gt 1 ]; then
	echo "Error: Too many parameters provided. Please provide only one."
	echo "Usage: $0 <directory_path/>"
	exit 1
fi

dir_path=$1

if [ "${dir_path: -1}" != "/" ]; then
	echo "The directory path must end with '/'"
	echo "Usage: $0 <directory_path/>"
	exit 1
fi

if [ ! -d "$dir_path" ]; then
	echo "Error: '$dir_path' the specified directory does not exist."
	echo "Usage: $0 <directory_path/>"
	exit 1
fi

if find "$dir_path" -type d 2>&1 | grep -q "Permission denied"; then
	echo "Error: Permission denied. You must use sudo to execute the command."
	echo "Usage: sudo $0 <directory_path/>"
	exit 1
fi
