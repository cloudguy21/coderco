#!/bin/bash

usage=$(du -sk ./arena | cut -f1)
threshold=100

echo "Usage: $usage KB"
echo "Threshold: $threshold KB"

if [ "$usage" -gt "$threshold" ]; then
    echo "ALERT: Disk usage exceeds threshold!"
else
    echo "Disk usage is within the threshold."
fi