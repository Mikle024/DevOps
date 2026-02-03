#!/bin/bash

if [ ! -d "$LOG_DIR" ]; then
  echo "ERROR: The directory with the logs '$LOG_DIR' was not found."
  echo "Please run the script from Part 04 first."
  exit 1
fi

LOG_FILES="$LOG_DIR/*.log"

if [ $# -ne 1 ]; then
  echo "Error: Exactly one parameter is required (1, 2, 3 or 4)."
  echo "Usage: $0 [1|2|3|4]"
  exit 1
fi