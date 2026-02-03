#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Permission denied: This script must be run as root."
  echo "Please run it with sudo: sudo "$0" [mode]"
  exit 1
fi

START_TIME=$(date +%s)

if [ $# -ne 3 ]; then
  echo "Error: The number of parameters is incorrect. Requires 3."
  echo "Usage example: $0 az az.az 3Mb"
  exit 1
fi
