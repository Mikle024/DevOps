#!/bin/bash

source ./start.sh

FOLDER_LETTERS=$1
FILE_LETTERS_RAW=$2
FILE_SIZE_RAW=$3

FILE_SIZE_NUM_MB=${FILE_SIZE_RAW%Mb}

FILE_NAME="${FILE_LETTERS_RAW%.*}"
FILE_EXTENSION="${FILE_LETTERS_RAW#*.}"

#FILE_NAME=$(echo "$FILE_LETTERS_RAW" | cut -d. -f1)
#FILE_EXTENSION=$(echo "$FILE_LETTERS_RAW" | cut -d. -f2)

source ./validation.sh
source ./utils.sh

LOG_FILE="part2_activity.log"
echo "$(date '+%Y-%m-%d %H:%M:%S') | START | script started" >> "$LOG_FILE"
POSSIBLE_PATHS=("/var" "/usr" "/opt" "/home")
DATE_SUFFIX=$(date +%d%m%y)

while true; do
  base_path=${POSSIBLE_PATHS[$RANDOM % ${#POSSIBLE_PATHS[@]}]}

  base_folder_name=$(generate_name "$FOLDER_LETTERS" 6)
  folder_name="${base_folder_name}_${DATE_SUFFIX}"
  current_path="$base_path/$folder_name"

  echo "Creating base folder: $current_path"
  if ! create_folder "$current_path"; then
    continue
  fi

  echo "Starting in new base directory: $current_path"

  nested_folder_count=$((RANDOM % 100 + 1))

  for (( i=1; i<=nested_folder_count; i++ )); do
    check_free_space

    inner_folder_name=$(generate_name "$FOLDER_LETTERS" 6)_${DATE_SUFFIX}
    current_path+="/$inner_folder_name"

    if ! create_folder "$current_path"; then
      continue 2
    fi

    files_to_create=$((RANDOM % 20 + 1))
    for (( j=1; j<=files_to_create; j++ )); do
      check_free_space

      base_file_name=$(generate_name "$FILE_NAME" 5)
      full_file_name=${base_file_name}_${j}_${DATE_SUFFIX}.${FILE_EXTENSION}
      file_path="$current_path/$full_file_name"

      if ! create_file "$file_path" "$FILE_SIZE_NUM_MB"; then
        continue 3
      fi
    done
  done
done