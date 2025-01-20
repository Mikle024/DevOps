#!/bin/bash

START_TIME=$(date +%s.%N)

source ./verification.sh
source ./utils.sh

echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_FOLDERS"
echo "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_FILES"
echo "Text files = $TXT_FILES"
echo "Executable files = $EXE_FILES"
echo "Log files (with the extension .log) = $LOG_FILES"
echo "Archive files = $ARCHIVE_FILES"
echo "Symbolic links = $SYMLINKS"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$LARGEST_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$LARGEST_EXECUTABLE_FILES"

END_TIME=$(date +%s.%N)
printf "Script execution time (in seconds) = %.6f sec.\n" "$(echo "$END_TIME - $START_TIME" | bc -l)"
