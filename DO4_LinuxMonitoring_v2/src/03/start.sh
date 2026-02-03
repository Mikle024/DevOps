#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Permission denied: This script must be run as root."
  echo "Please run it with sudo: sudo "$0" [mode]"
  exit 1
fi

if [ $# -ne 1 ]; then
  echo "Error: Exactly one parameter is required (1, 2, or 3)."
  echo "Usage: $0 [1/2/3]"
  echo "1 - Cleaning by log file"
  echo "2 - Cleaning by date and time"
  echo "3 - Cleaning by name mask"
  exit 1
fi
