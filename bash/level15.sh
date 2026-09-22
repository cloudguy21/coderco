#!/bin/bash

echo "===== Boss Battle Menu ====="
echo "1. Check disk space"
echo "2. Show system uptime"
echo "3. Backup arena"
echo "4. Parse settings"
echo "5. Exit"

read -p "Choose an option: " choice

case $choice in
    1)
        df -h
        ;;
    2)
        uptime
        ;;
    3)
    
    timestamp=$(date +%Y%m%d_%H%M%S)

    cp -r ./arena "backup/arena_$timestamp"

    backup_count=$(find backup -maxdepth 1 -type d -name 'arena_*' | wc -l)

    if [ "$backup_count" -gt 3 ]; then
        oldest=$(find backup -maxdepth 1 -type d -name 'arena_*' | sort | head -n 1)
        rm -rf "$oldest"
    fi

    echo "Backup completed: arena_$timestamp"
    ;;
    4)
        
    while IFS='=' read -r key value
    do
        echo "Key: $key"
        echo "Value: $value"
    done < settings.conf
    ;;

    5)
        echo "Goodbye!"
        exit
        ;;
    *)
        echo "Invalid option"
        ;;
esac