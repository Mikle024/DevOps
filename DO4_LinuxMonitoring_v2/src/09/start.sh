#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Permission denied: This script must be run as root."
  echo "Please run it with sudo: sudo $0"
  exit 1
fi