#!/bin/bash

LOG_DIR="../04"

source ./validation.sh

MODE=$1

case $MODE in
  1)
    echo "--- All entries sorted by response code ---"
    cat $LOG_FILES | sort -k9 -n
    ;;

  2)
    echo "--- All unique IP addresses ---"
    awk '{print $1}' $LOG_FILES | sort -u
    ;;

  3)
    echo "--- All requests with errors (4xx, 5xx) ---"
    awk '$9 ~ /^[45]/' $LOG_FILES
    ;;

  4)
    echo "--- Unique IP addresses among erroneous requests ---"
    awk '$9 ~ /^[45]/ {print $1}' $LOG_FILES | sort -u
    ;;

  *)
    echo "Error: Incorrect mode. Specify 1, 2, 3, or 4."
    exit 1
    ;;
esac