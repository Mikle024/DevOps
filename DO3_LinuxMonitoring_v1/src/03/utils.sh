#!/bin/bash

HOSTNAME=$(hostname)
TIMEZONE=$(cat /etc/timezone)
USER=$(whoami)
OS=$(lsb_release -d | cut -f2-)
DATE=$(date +"%d %b %Y %T")

UPTIME=$(uptime -p | sed 's/^up //')
UPTIME_SEC=$(cat /proc/uptime | awk '{print int($1)}')

IP=$(hostname -I | awk '{print $1}')
CIDR=$(ip a show enp0s3 2>/dev/null | grep -oP 'inet \K[\d.]+/\d+' || ip a show eth0 2>/dev/null | grep -oP 'inet \K[\d.]+/\d+')
NETMASK=$(echo $CIDR | cut -d '/' -f2)
MASK=$(printf "%d.%d.%d.%d\n" \
	$((0xFF & (0xFFFFFFFF << (32 - $NETMASK)) >> 24)) \
	$((0xFF & (0xFFFFFFFF << (32 - $NETMASK)) >> 16 & 0xFF)) \
	$((0xFF & (0xFFFFFFFF << (32 - $NETMASK)) >> 8 & 0xFF)) \
	$((0xFF & (0xFFFFFFFF << (32 - $NETMASK)) & 0xFF)))
GATEWAY=$(ip route | grep default | awk '{print $3}')

RAM_TOTAL=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')

SPACE_ROOT=$(df / | awk '/\// {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df / | awk '/\// {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df / | awk '/\// {printf "%.2f MB", $4/1024}')
