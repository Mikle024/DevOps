#!/bin/bash

if [[ ! "$TARGET_PATH" =~ ^/ ]]; then
  echo "Error: Parameter 1 ($TARGET_PATH) must be an absolute path."
  exit 1
fi

if ! [[ "$FOLDER_COUNT" =~ ^[0-9]+$ ]]; then
  echo "Error: Parameter 2 ($FOLDER_COUNT) must be a positive integer."
  exit 1
fi

if ! [[ "$FOLDER_LETTERS" =~ ^[a-zA-Z]{1,7}$ ]]; then
  echo "Error: Parameter 3 ($FOLDER_LETTERS) must consist of 1-7 letters of the English alphabet."
  exit 1
fi

if ! [[ "$FILE_COUNT" =~ ^[0-9]+$ ]]; then
  echo "Error: Parameter 4 ($FILE_COUNT) must be a positive integer."
  exit 1
fi

if ! [[ "$FILE_NAME" =~ ^[a-zA-Z]{1,7}$ ]]; then
  echo "Error: Parameter 5 ($FILE_LETTERS_RAW) has an incorrect format. Name - up to 7 letters. For example: 'az.az'."
  exit 1
fi

if ! [[ "$FILE_EXTENSION" =~ ^[a-zA-Z]{1,3}$ ]]; then
  echo "Error: Parameter 5 ($FILE_LETTERS_RAW) has an incorrect format. Extension - up to 3 letters. For example: 'az.az'."
  exit 1
fi

if ! [[ "$FILE_SIZE_RAW" =~ ^[0-9]+kb$ ]]; then
  echo "Error: Parameter 6 ($FILE_SIZE_RAW) must be a number with 'kb' at the end (for example, '55kb')."
  exit 1
fi

FILE_SIZE_NUM=${FILE_SIZE_RAW%kb}
if [ "$FILE_SIZE_NUM" -gt 100 ] || [ "$FILE_SIZE_NUM" -eq 0 ]; then
  echo "Error: The file size in parameter 6 ($FILE_SIZE_RAW) must not exceed 100kb and must be greater than 0."
  exit 1
fi