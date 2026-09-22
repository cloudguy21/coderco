#!/bin/bash

timestamp=$(date +%Y%m%d_%H%M%S)

echo "Backup timestamp: $timestamp"

cp -r ./arena "backup/arena_$timestamp"

backup_count=$(find backup -maxdepth 1 -type d -name 'arena_*' | wc -l)

if [ "$backup_count" -gt 5 ]; then
    oldest=$(find backup -maxdepth 1 -type d -name 'arena_*' | sort | head -n 1)
    rm -rf "$oldest"
fi
