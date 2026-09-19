#!/bin/bash

mkdir -p arena_boss

for file in arena_boss/file{1..5}.txt
do
    > "$file"
    lines=$((RANDOM % 11 + 10))

    for ((i=1; i<=lines; i++))
    do
        echo "Battle line $i" >> "$file"
    done
done

echo "Victory" >> arena_boss/file2.txt
echo "Victory" >> arena_boss/file4.txt

echo "Files sorted by size:"
ls -lSr arena_boss/*.txt

mkdir -p arena_boss/victory_archive

grep -l "Victory" arena_boss/*.txt | while read -r file
do
    mv "$file" arena_boss/victory_archive/
done