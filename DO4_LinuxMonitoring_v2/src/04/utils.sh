#!/usr/bin/bash

get_random_element() {
  local arr=("$@")
  echo "${arr[RANDOM % ${#arr[@]}]}"
}

generate_random_ip() {
  echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}