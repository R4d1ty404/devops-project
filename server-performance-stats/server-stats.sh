#!/bin/bash

echo -e "\e[31mServer Status\e[0m\n"

echo -e "\e[33mCPU Report\e[0m"
top -bn 1 | awk '/Cpu/ {print "Total CPU usage : " 100-$8 "%\n"}'

echo -e "\e[33mMemory Report\e[0m"
free -th | awk '/Mem/ {print "Memory Used : " $3 "\nMemory Available : " $7 "\nMemory Percentage Used : " ($3 / $2) * 100 "%\n"}'

echo -e "\e[33mDisk Report\e[0m"
df -h | awk '/\/dev\/nvme0n1p6/ {print "Disk usage : " $3 "\nDisk Available : " $4 "\nDisk Usage Percentage : " $5 "\n"}'

echo -e "\e[33mTop Process Report By CPU\e[0m"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 5
echo -e "\n"

echo -e "\e[33mTop Process Report By Memory\e[0m"
ps -eo pid,comm,%mem --sort=-%mem | head -n 5
