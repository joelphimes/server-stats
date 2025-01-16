#!/bin/bash

# Function to get total CPU usage
total_cpu() {
    ps -A -o %cpu | awk '{s+=$1} END {print s}'
}

# function to get total memory usage
total_mem_usage() {
    free -h | awk 'NR>1 {print $1, $2, $3, $4, $5, $6, $7}'
}

# function to get total disk usage
total_disk_usage() {
    df -h | awk 'NR>1 {print $1, $2, $3, $4, $5, $6, $7}'
}

# function to get top 5 processes by CPU usage
top_cpu_processes() {
    ps -eo %cpu,pid,comm | sort -k 1 -r | head -5
}

# function to get top 5 processes by memory usage
top_mem_processes() {
    ps -eo %mem,pid,comm | sort -k 1 -r | head -5
}

# conversion of function to var
total_cpu_usage=$(total_cpu)
total_mem_usage=$(total_mem_usage)
total_disk_usage=$(total_disk_usage)
top_cpu_processes=$(top_cpu_processes)
top_mem_processes=$(top_mem_processes)

# output
echo " "
echo "Total CPU Usage:"
echo $total_cpu_usage
echo " "
echo "Total Memory Usage:"
echo "$total_mem_usage"
echo " "
echo "Total Disk Usage:"
echo "$total_disk_usage"
echo " "
echo "Top 5 Proccesses by CPU Usage are as follows .."
echo " "
echo "$top_cpu_processes"
echo " "
echo "Top 5 Proccesses by Memory Usage are as follows .."
echo " "
echo "$top_mem_processes"