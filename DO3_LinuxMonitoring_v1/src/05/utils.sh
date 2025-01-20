#!/bin/bash

TOTAL_FOLDERS=$(find "$dir_path" -type d | wc -l)
TOP_FOLDERS=$(du -h "$dir_path"* | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')
TOTAL_FILES=$(find "$dir_path" -type f | wc -l)
CONF_FILES=$(find "$dir_path" -type f -name "*.conf" | wc -l)
TXT_FILES=$(find "$dir_path" -type f -name "*.txt" | wc -l)
EXE_FILES=$(find "$dir_path" -type f -executable | wc -l)
LOG_FILES=$(find "$dir_path" -type f -name "*.log" | wc -l)
ARCHIVE_FILES=$(find "$dir_path" -type f \( -name "*.zip" -o -name "*.7z" -o -name "*.tar" -o -name "*.rar" -o -name "*.gz" \) | wc -l)
SYMLINKS=$(find "$dir_path" -type l | wc -l)
LARGEST_FILES="$(find "$dir_path" -type f -exec du -h {} + | sort -hr | sed -n '1,10'p | awk '{printf("%d - %s, %s, ", NR, $2, $1); system("bash -c '\''file -b --mime-type "$2"'\''")}')"
LARGEST_EXECUTABLE_FILES=$(find "$dir_path" -type f -executable -exec du -h {} + | sort -hr | head -n 10 | awk '{printf "%d - %s, %s, ", NR, $2, $1; system("md5sum " $2 " | cut -d\" \" -f1")}')
