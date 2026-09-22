#!/bin/bash

echo "===== System Menu ====="
echo "1. Check disk space"
echo "2. Show system uptime"
echo "3. List users"
echo "4. Exit"

read -p "Choose an option: " choice

case $choice in
    1)
        df -h
        ;;
    2)
        uptime
        ;;
    3)
        cut -d: -f1 /etc/passwd
        ;;
    4)
        echo "Goodbye!"
        exit
        ;;
    *)
        echo "Invalid option"
        ;;
esac