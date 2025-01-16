#!/bin/bash

#Total CPU usage
total_cpu=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
echo "Total CPU Usage: $total_cpu%"

#Total memory usage (Free vs Used including percentage)


#Total disk usage (Free vs Used including percentage)
total_disk=$(df -h)
echo "Total Disk Usasge: $total_disk"

#Top 5 processes by CPU usage
top_5_proc_cpu=$(ps -eo %cpu,pid,comm | sort -k 1 -r | head -5)
echo "Top 5 Proccesses by CPU usage are as follows .."
echo $top_5_proc_cpu

#Top 5 processes by memory usage
top_5_proc_mem=$(ps -eo pmem,pid,comm | sort -k 1 -r | head -5)
echo  "Top 5 Proccesses by MEM usage are as follows .."
echo $top_5_proc_mem