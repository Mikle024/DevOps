#!/bin/bash

if [ $# -ne 6 ]; then
  echo "Error: The number of parameters is incorrect. Requires 6."
  echo "Usage example: $0 /opt/test 4 az 5 az.az 3kb"
  exit 1
fi

TARGET_PATH=$1
FOLDER_COUNT=$2
FOLDER_LETTERS=$3
FILE_COUNT=$4
FILE_LETTERS_RAW=$5
FILE_SIZE_RAW=$6

FILE_NAME="${FILE_LETTERS_RAW%.*}"
FILE_EXTENSION="${FILE_LETTERS_RAW#*.}"

#FILE_NAME=$(echo "$FILE_LETTERS_RAW" | cut -d. -f1)
#FILE_EXTENSION=$(echo "$FILE_LETTERS_RAW" | cut -d. -f2)

DATE_SUFFIX=$(date +%d%m%y)
LOG_FILE="activity.log"

source ./validation.sh
source ./utils.sh

echo "$(date '+%Y-%m-%d %H:%M:%S') | START | script started" > "$LOG_FILE"

current_path=$TARGET_PATH

for (( i=1; i<=FOLDER_COUNT; i++ )); do
  check_free_space

  base_folder_name=$(generate_name "$FOLDER_LETTERS" 5)_${DATE_SUFFIX}
  current_path+="/$base_folder_name"

  if ! create_folder "$current_path"; then
    exit 1
  fi

    for (( j=1; j<=FILE_COUNT; j++ )); do
      check_free_space

      base_file_name=$(generate_name "$FILE_NAME" 5)
      full_file_name="${base_file_name}_${j}_${DATE_SUFFIX}.${FILE_EXTENSION}"
      file_path="$current_path/$full_file_name"

      if ! create_file "$file_path" "$FILE_SIZE_NUM"; then
        exit 1
      fi
    done
done

echo "Folder creation is complete."
echo "$(date '+%Y-%m-%d %H:%M:%S') | FINISH | Script finished" >> $LOG_FILE
echo "The script has been completed. All activity is recorded in $LOG_FILE."
