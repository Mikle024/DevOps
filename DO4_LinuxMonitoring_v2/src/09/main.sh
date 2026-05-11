#!/bin/bash

source ./start.sh

METRICS_FILE="/var/www/html/metrics.html"
METRICS_DIR=$(dirname "$METRICS_FILE")

if [ ! -d "$METRICS_DIR" ]; then
    mkdir -p "$METRICS_DIR"
fi

while true; do
    # 1. CPU
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    # 2. RAM
    mem_total=$(free -b | grep Mem | awk '{print $2}')
    mem_used=$(free -b | grep Mem | awk '{print $3}')
    mem_available=$(free -b | grep Mem | awk '{print $7}')

    # 3. HDD
    disk_total=$(df -B1 / | awk 'NR==2 {print $2}')
    disk_used=$(df -B1 / | awk 'NR==2 {print $3}')
    disk_available=$(df -B1 / | awk 'NR==2 {print $4}')

    cat <<EOF > "$METRICS_FILE.tmp"
# HELP my_cpu_usage_percent CPU usage in percent
# TYPE my_cpu_usage_percent gauge
my_cpu_usage_percent $cpu_usage

# HELP my_mem_total_bytes Total memory in bytes
# TYPE my_mem_total_bytes gauge
my_mem_total_bytes $mem_total

# HELP my_mem_used_bytes Used memory in bytes
# TYPE my_mem_used_bytes gauge
my_mem_used_bytes $mem_used

# HELP my_mem_available_bytes Available memory in bytes
# TYPE my_mem_available_bytes gauge
my_mem_available_bytes $mem_available

# HELP my_disk_total_bytes Total disk space in bytes
# TYPE my_disk_total_bytes gauge
my_disk_total_bytes $disk_total

# HELP my_disk_used_bytes Used disk space in bytes
# TYPE my_disk_used_bytes gauge
my_disk_used_bytes $disk_used

# HELP my_disk_available_bytes Available disk space in bytes
# TYPE my_disk_available_bytes gauge
my_disk_available_bytes $disk_available

EOF

    mv "$METRICS_FILE.tmp" "$METRICS_FILE"

    sleep 3
done