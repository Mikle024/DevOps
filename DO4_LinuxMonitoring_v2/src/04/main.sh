#!/bin/bash

# Коды ответа HTTP
# 200 OK, 201 Created
# 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found
# 500 Internal Server Error, 501 Not Implemented, 502 Bad Gateway, 503 Service Unavailable
HTTP_STATUS_CODE=(200 201 400 401 403 404 500 501 502 503)

HTTP_METHODS=("GET" "POST" "PUT" "PATCH" "DELETE")

URLS=("/index.html" "/api/v1/users" "/static/style.css" "docs/main" "admin/login")

USER_AGENTS=(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.360"
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0)"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7; rv:107.0) Gecko/20100101 Firefox/107.0"
    "Opera/9.80 (Windows NT 6.1; WOW64) Presto/2.12.388 Version/12.18"
    "Goolebot/2.1 (+http://www.google.com/bot.html)"
)

source ./utils.sh

for i in {1..5}
do
  LOG_DATE=$(date -d "today - $i days" +%Y-%m-%d)
  LOG_FILE_NAME="access_log_$i.log"

  echo "Log generation: $LOG_FILENAME for the date $LOG_DATE"

  RECORD_COUNT=$((RANDOM % 901 + 100))

  current_timestamp=$(date -d "$LOG_DATE 00:00:00" +%s)

  for ((j=1; j<=RECORD_COUNT; j++)); do
    current_timestamp=$((current_timestamp + RANDOM % 30 + 1))

    log_time=$(date -d "@$current_timestamp" "+%d/%b/%Y:%H:%M:%S %z")

    ip=$(generate_random_ip)
    method=$(get_random_element "${HTTP_METHODS[@]}")
    url=$(get_random_element "${URLS[@]}")
    status=$(get_random_element "${HTTP_STATUS_CODE[@]}")
    user_agent=$(get_random_element "${USER_AGENTS[@]}")
    bytes_sent=$((RANDOM % 4000 + 100))

    log_entry="$ip - - [$log_time] \"$method $url HTTP/1.1\" $status $bytes_sent \"-\" \"$user_agent\""

    echo "$log_entry" >> "$LOG_FILE_NAME"
  done
done

echo "Generation of 5 log files is completed."