# Bash Battle Arena 🎮

## Level 1 — Creating Files and Directories

I created a directory called `Arena` and created three text files inside it:

```bash
mkdir Arena
cd Arena
touch warrior.txt mage.txt archer.txt
```

I then listed the contents with:

```bash
ls
```

This helped me practise creating directories and files from the command line.

---

## Level 2 — Using a Loop

I created a Bash script called `loop.sh` that prints the numbers 1 to 10.

```bash
#!/bin/bash

for number in $(seq 1 10)
do
    echo "number: $number"
done
```

I made the script executable with:

```bash
chmod +x loop.sh
```

A `for` loop repeats an action. The variable `number` changes value during each iteration.

---

## Level 3 — Using an If Statement

I created `check_hero.sh` to check whether `hero.txt` exists.

```bash
#!/bin/bash

if [ -f "hero.txt" ]
then
    echo "Hero found!"
else
    echo "Hero missing!"
fi
```

The `[ -f ]` condition checks whether a regular file exists.

This introduced me to conditional statements in Bash.

---

## Level 4 — Copying Files

I created `backup.sh` to copy all `.txt` files into a `backup` directory.

```bash
#!/bin/bash

mkdir backup

cp *.txt backup/
```

The `cp` command copies files.

The `*.txt` pattern matches all text files in the current directory.

---

## Level 5 — Boss Battle

I created `boss_battle.sh`.

The script creates a `battlefield` directory and three files:

```bash
mkdir battlefield

touch battlefield/knight.txt battlefield/sorcerer.txt battlefield/rogue.txt
```

I then used an `if` statement to check whether `knight.txt` exists:

```bash
if [ -f "battlefield/knight.txt" ]
then
    mkdir archive
    mv battlefield/knight.txt archive/

    ls battlefield
    ls archive
fi
```

The `mv` command moves a file from one location to another.

After running the script, `knight.txt` was successfully moved into `archive`, while `rogue.txt` and `sorcerer.txt` remained in `battlefield`.

## What I Learned

Levels 1–5 helped me build the basic Bash skills needed for the next challenges.

I learned how to:

* Create directories and files
* Use `for` loops
* Use `if` statements and file conditions
* Make scripts executable
* Copy files with `cp`
* Move files with `mv`
* Work with file paths
* Combine several Bash commands into a script

# Bash Battle Arena 🎮 — Levels 6–10

## Level 6 — Count Lines in a File

I created a script called `line_count.sh` that accepts a filename as an argument and counts the number of lines in the file.

```bash
#!/bin/bash

if [ -z "$1" ]
then
    echo "No file provided"
else
    wc -l "$1"
fi
```

The script checks whether a filename was provided.

* `$1` represents the first command-line argument.
* `-z` checks whether the argument is empty.
* `wc -l` counts the number of lines in the file.

If no filename is provided, the script displays:

```text
No file provided
```

### What I learned

I learned how Bash scripts can accept information from the command line and use that information inside the script.

---

## Level 7 — Sort Files by Size

For this level, I worked with `ls` to display `.txt` files according to their size.

```bash
ls -lSr *.txt
```

The important options are:

* `-l` — displays detailed file information.
* `-S` — sorts files by size.
* `-r` — reverses the order.

Using `-S` together with `-r` allows the files to be displayed from smallest to largest.

### What I learned

I learned how command options can be combined to change the behaviour of a Linux command and how file size is displayed in the detailed `ls` output.

---

## Level 8 — Search Log Files

I created several `.log` files and used `grep` to search for a specific word.

```bash
grep "Victory" *.log
```

This searches every `.log` file in the current directory for the word `Victory`.

I then used:

```bash
grep -l "Victory" *.log
```

The `-l` option makes `grep` display only the names of files containing the match.

For example:

```text
battle.log
enemy.log
```

### What I learned

I learned that Linux is case-sensitive, so searching for `victory` and `Victory` produces different results.

I also learned that command flags are specific to the command being used. For example:

* `wc -l` → counts lines
* `grep -l` → displays matching filenames
* `ls -l` → displays a detailed file listing

---

## Level 9 — Monitor Directory Changes

For Level 9, I used `inotifywait` to monitor a directory for file creation, modification, and deletion.

The monitoring command was:

```bash
inotifywait -m -e create -e modify -e delete \
--timefmt '%Y-%m-%d %H:%M:%S' \
--format '%T %e %w%f' \
.
```

I then placed this functionality inside `monitor.sh` and redirected the output to a log file outside the directory being monitored.

```bash
#!/bin/bash

inotifywait -m -e create -e modify -e delete \
--timefmt '%Y-%m-%d %H:%M:%S' \
--format '%T %e %w%f' \
. >> ../changes.log
```

The log records:

* Timestamp
* Event type
* File path

Example:

```text
2026-09-19 18:35:10 CREATE ./final_test.txt
2026-09-19 18:35:10 MODIFY ./final_test.txt
2026-09-19 18:35:29 MODIFY ./final_test.txt
2026-09-19 18:35:29 DELETE ./final_test.txt
```

The log is stored outside the monitored directory so that the monitoring process does not detect its own log updates.

### What I learned

This level introduced me to event-based monitoring in Linux and showed me how scripts can react to filesystem activity.

---

# Level 10 — Boss Battle 🐉

The final level of this section combined several Bash concepts into one script.

I created `boss_level10.sh`.

The script:

1. Creates the `arena_boss` directory.
2. Creates five text files.
3. Generates a random number of lines between 10 and 20.
4. Adds the generated lines to each file.
5. Adds `Victory` to selected files.
6. Sorts the files by size.
7. Searches for files containing `Victory`.
8. Moves matching files into `victory_archive`.

The main loop generates the files:

```bash
for file in arena_boss/file{1..5}.txt
do
    > "$file"
    lines=$((RANDOM % 11 + 10))

    for ((i=1; i<=lines; i++))
    do
        echo "Battle line $i" >> "$file"
    done
done
```

The random line count comes from:

```bash
RANDOM % 11 + 10
```

This produces a number from **10 to 20**.

I then added the victory condition:

```bash
echo "Victory" >> arena_boss/file2.txt
echo "Victory" >> arena_boss/file4.txt
```

The files are sorted by size using:

```bash
ls -lSr arena_boss/*.txt
```

Finally, I searched for files containing `Victory` and moved them into the archive:

```bash
grep -l "Victory" arena_boss/*.txt | while read -r file
do
    mv "$file" arena_boss/victory_archive/
done
```

### What I learned

Level 10 brought together several Bash concepts I had learned throughout the previous levels:

* Variables
* Loops
* Command-line tools
* File creation
* Random values
* `grep`
* File movement
* Directory creation
* File sorting
* Conditional processing

Most importantly,
