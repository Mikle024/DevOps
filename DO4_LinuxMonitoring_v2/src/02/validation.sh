#!/bin/bash

if ! [[ "$FOLDER_LETTERS" =~ ^[a-zA-Z]{1,7}$ ]]; then
  echo "Error: Parameter 1 ($FOLDER_LETTERS) must consist of 1-7 letters of the English alphabet."
  exit 1
fi

if ! [[ "$FILE_NAME" =~ ^[a-zA-Z]{1,7}$ ]]; then
  echo "Error: Parameter 2 ($FILE_LETTERS_RAW) has an incorrect format. Name - up to 7 letters. For example: 'az.az'."
  exit 1
fi

if ! [[ "$FILE_EXTENSION" =~ ^[a-zA-Z]{1,3}$ ]]; then
  echo "Error: Parameter 2 ($FILE_LETTERS_RAW) has an incorrect format. Extension - up to 3 letters. For example: 'az.az'."
  exit 1
fi

if ! [[ "$FILE_SIZE_RAW" =~ ^[0-9]+Mb$ ]]; then
  echo "Error: Parameter 3 ($FILE_SIZE_RAW) must be a number with 'Mb' at the end (for example, '55Mb')."
  exit 1
fi

if [ "$FILE_SIZE_NUM_MB" -gt 100 ] || [ "$FILE_SIZE_NUM_MB" -eq 0 ]; then
  echo "Error: The file size in parameter 3 ($FILE_SIZE_RAW) must not exceed 100Mb and must be greater than 0."
  exit 1
fi