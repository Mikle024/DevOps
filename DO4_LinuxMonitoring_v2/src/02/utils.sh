#!/bin/bash

ONE_GB_IN_KB=1048576

check_free_space() {
  AVAILABLE_SPACE_KB=$(df / | awk 'NR==2 {print $4}')

  if [ "$AVAILABLE_SPACE_KB" -le "$ONE_GB_IN_KB" ]; then
    echo "Attention: There is less than 1 GB left in the file system. The script has been stopped."

    END_TIME=$(date +%s)
    TOTAL_TIME=$((END_TIME - START_TIME))

    echo "Work start time: $(date -d @$START_TIME)" >> "$LOG_FILE"
    echo "End time of work: $(date -d @$END_TIME)" >> "$LOG_FILE"
    echo "Total working hours: $TOTAL_TIME seconds" >> "$LOG_FILE"

    echo "Work start time: $(date -d @$START_TIME)"
    echo "End time of work: $(date -d @$END_TIME)"
    echo "Total working hours: $TOTAL_TIME seconds"

    exit 0
  fi
}

generate_name() {
  local base_letters=$1
  local min_length=$2

  local new_name=$base_letters
  local last_char=${base_letters: -1}

  while [ ${#new_name} -lt "$min_length" ]; do
      new_name+=$last_char
  done

  echo "$new_name"
}

create_folder() {
  local path_to_create=$1
  if mkdir -p "$path_to_create"; then
    echo "Folder created: $path_to_create"
    echo "$(date '+%Y-%m-%d %H:%M:%S') | FOLDER | $path_to_create" >> "$LOG_FILE"
    return 0
  else
    echo "Error: Failed to create the $path_to_create folder"
    echo "$(date '+%Y-%m-%d %H:%M:%S') | ERROR | Failed to create folder $path_to_create" >> "$LOG_FILE"
    return 1
  fi
}

create_file() {
  local file_path=$1
  local file_size_mb=$2
  if fallocate -l "${file_size_mb}M" "$file_path"; then
    echo " - A file has been created: $file_path"
    echo "$(date '+%Y-%m-%d %H:%M:%S') | FILE | $file_path | ${file_size_mb}Mb" >> "$LOG_FILE"
    return 0
  else
    echo " - Error: The $file_path file could not be created"
    echo "$(date '+%Y-%m-%d %H:%M:%S') | ERROR | Failed to create file $file_path" >> "$LOG_FILE"
    return 1
  fi
}