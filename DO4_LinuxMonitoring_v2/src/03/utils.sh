#!/bin/bash

confirm_and_delete() {
  local tmp_file
  tmp_file=$(mktemp)

  cat > "$tmp_file"
  trap 'rm -f "$tmp_file"' return

  if [ ! -s "$tmp_file" ]; then
    echo "No items match the criteria were found."
    rm -f "$tmp_file"
    return
  fi

  echo
  echo "The following items and ALL THEIR CONTENTS will be deleted:"
  tr '\0' '\n' < "$tmp_file"
  echo

  echo -n "Are you sure you want to continue? (y/n): "
  read -r confirmation < /dev/tty
  if [[ "${confirmation,,}" != "y" && "${confirmation,,}" != "yes" ]]; then
    echo "Deletion cancelled by the user."
    return
  fi

  echo "Deleting..."
  xargs -0 -r rm -rf -- < "$tmp_file"

  echo "Cleanup complete."
}

cleanup_by_log() {
  echo "Running the cleanup on the log file..." >&2

  LOG_FILE="../02/part2_activity.log"

  if [ ! -f "$LOG_FILE" ]; then
    echo "Error: The $LOG_FILE was not found." >&2
    return 1
  fi

  echo "Reading log file..." >&2

  (grep -E "FILE|FOLDER" "$LOG_FILE" | cut -d'|' -f3 | sed 's/^[ ]*//;s/[ ] *$//' | sort -r | tr '\n' '\0') | confirm_and_delete
}

cleanup_by_datetime() {
  echo "Starting cleanup by date and time..." >&2

  echo "Enter the start time in the format 'YYYY-MM-DD HH:MM' (e.g., '2025-11-14 12:51'):" >&2
  read -r start_time < /dev/tty
  if ! date -d "$start_time" >/dev/null 2>&1; then
    echo "Error: Invalid start time format." >&2
    return 1
  fi

  echo "Enter the end time in the format 'YYYY-MM-DD HH:MM' (e.g., '2025-11-14 12:54'):" >&2
  read -r end_time < /dev/tty
  if ! date -d "$end_time" >/dev/null 2>&1; then
    echo "Error: Invalid end time format." >&2
    return 1
  fi

  local start_seconds
  start_seconds=$(date -d "$start_time" +%s)
  local end_seconds
  end_seconds=$(date -d "$end_time" +%s)

  if [ "$start_seconds" -ge "$end_seconds" ]; then
    echo "Error: Start time must be earlier than end time."
    return 1
  fi

  local search_paths=("/var" "/usr" "/opt" "/home")

  local args_for_find=(
    "-type" "d"
    "-name" "*_[0-9][0-9][0-9][0-9][0-9][0-9]"
    "-newermt" "$start_time"
    "!" "-newermt" "$end_time"
    )

    find "${search_paths[@]}" "${args_for_find[@]}" -print0 2>/dev/null | confirm_and_delete
}

cleanup_by_mask() {
  echo "Starting cleanup by name mask..." >&2
  echo "Enter a name mask for files and folders." >&2
  echo "Hint: to find script-generated files, use a mask like 'azzzzz_*_141125*'" >&2
  read -r name_mask < /dev/tty

  if [ -z "$name_mask" ]; then
    echo "Error: Mask cannot be empty." >&2
    return 1
  fi

  local search_paths=("/var" "/usr" "/opt" "/home")
  local args_for_find=(
    "(" "-type" "d" "-o" "-type" "f" ")"
    "-name" "$name_mask"
  )

  find "${search_paths[@]}" "${args_for_find[@]}" -print0 2>/dev/null | confirm_and_delete
}