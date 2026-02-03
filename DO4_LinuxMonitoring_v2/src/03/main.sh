#!/bin/bash

source ./start.sh

CLEANUP_MODE=$1

source ./utils.sh

case $CLEANUP_MODE in
  1)
    cleanup_by_log
    ;;
  2)
    cleanup_by_datetime
    ;;
  3)
    cleanup_by_mask
    ;;
  *)
    echo "Error: Incorrect mode. Specify 1, 2, or 3."
    exit 1
    ;;
esac