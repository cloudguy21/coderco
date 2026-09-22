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

# Bash Battle Arena: Levels 11–15

## Level 11: Automated Disk Space Report

### What I built

I created a script that checks the disk usage of the `arena` directory and compares it against a set threshold.

If the usage goes above the threshold, the script displays an alert.

### Script

```bash
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
```

### Commands learned

| Command    | What it does               |
| ---------- | -------------------------- |
| `du`       | Shows disk usage           |
| `du -s`    | Shows a summary total      |
| `du -k`    | Shows the size in KB       |
| `cut`      | Extracts parts of text     |
| `cut -f1`  | Gets the first field       |
| `if`       | Performs a condition check |
| `-gt`      | Means greater than         |
| `chmod +x` | Makes a script executable  |

### What I learned

I learned how to get the size of a directory and use that value inside a Bash variable. I also learned how to compare numbers using an `if` statement and trigger different actions depending on the result.

---

## Level 12: Simple Configuration File Parser

### What I built

I created a `settings.conf` file using `KEY=VALUE` format:

```text
NAME=John
ENVIRONMENT=development
PORT=8000
APP=test-app
```

I then created a script that reads each line and separates the key from the value.

### Script

```bash
#!/bin/bash

while IFS='=' read -r key value
do
    echo "Key: $key"
    echo "Value: $value"
done < settings.conf
```

### Commands and concepts learned

| Command / concept | What it does                                       |
| ----------------- | -------------------------------------------------- |
| `while`           | Repeats commands while a condition is true         |
| `read`            | Reads input                                        |
| `IFS`             | Defines how Bash separates input                   |
| `IFS='='`         | Tells Bash to split at `=`                         |
| `read -r`         | Reads input without treating backslashes specially |
| `<`               | Redirects a file into a command or loop            |
| `echo`            | Prints text                                        |

### What I learned

I learned how configuration files can store settings as key-value pairs and how Bash can read and separate those values automatically.

I also learned that a newline at the end of a file matters when reading files line by line.

---

## Level 13: Backup Script with Rotation

### What I built

I created a backup script that copies the `arena` directory into a `backup` directory.

Each backup receives a timestamp so that every backup has a unique name.

The script also keeps only the most recent 5 backups and removes the oldest when there are more than 5.

### Script

```bash
#!/bin/bash

timestamp=$(date +%Y%m%d_%H%M%S)

echo "Backup timestamp: $timestamp"

cp -r ./arena "backup/arena_$timestamp"

backup_count=$(find backup -maxdepth 1 -type d -name 'arena_*' | wc -l)

if [ "$backup_count" -gt 5 ]; then
    oldest=$(find backup -maxdepth 1 -type d -name 'arena_*' | sort | head -n 1)
    rm -rf "$oldest"
fi
```

### Commands and concepts learned

| Command     | What it does                         |
| ----------- | ------------------------------------ |
| `date`      | Displays the current date and time   |
| `cp`        | Copies files or directories          |
| `cp -r`     | Recursively copies a directory       |
| `find`      | Searches for files or directories    |
| `wc -l`     | Counts lines                         |
| `sort`      | Sorts text                           |
| `head -n 1` | Gets the first line                  |
| `rm -rf`    | Removes a directory and its contents |
| `$(...)`    | Runs a command and stores its output |

### Date formatting

```text
%Y = four-digit year
%m = month
%d = day
%H = hour
%M = minute
%S = seconds
```

This produces timestamps such as:

```text
20260922_225412
```

### What I learned

I learned how automated backups can be created with timestamps and how old backups can be automatically removed.

I also learned why consistent timestamp formats are useful because they allow backup names to be sorted chronologically.

---

## Level 14: User-Friendly Menu Script

### What I built

I created an interactive Bash menu that allows the user to choose a system task.

The options were:

1. Check disk space
2. Show system uptime
3. List users
4. Exit

### Main commands

```bash
df -h
```

Shows disk space in a human-readable format.

```bash
uptime
```

Shows how long the system has been running and the system load.

```bash
cut -d: -f1 /etc/passwd
```

Extracts the usernames from `/etc/passwd`.

### Concepts learned

| Command / concept | What it does                                   |
| ----------------- | ---------------------------------------------- |
| `read`            | Gets input from the user                       |
| `case`            | Runs different commands depending on the input |
| `;;`              | Ends a `case` option                           |
| `*)`              | Handles anything that doesn't match            |
| `exit`            | Exits the script                               |
| `df -h`           | Shows disk usage                               |
| `uptime`          | Shows system uptime                            |
| `cut -d:`         | Uses `:` as the delimiter                      |
| `cut -f1`         | Selects the first field                        |

### What I learned

I learned how to make Bash scripts interactive instead of simply running commands from start to finish.

I also learned how `case` statements can be used to build simple command-line menus.

---

# Level 15: Boss Battle 3

## What I built

Level 15 combined the concepts from Levels 11–14 into one menu-driven script.

The final menu contains:

1. Check disk space
2. Show system uptime
3. Backup `arena` and keep the last 3 backups
4. Parse `settings.conf`
5. Exit

### Key sections

#### Disk space

```bash
df -h
```

#### System uptime

```bash
uptime
```

#### Backup and rotation

The backup section reused the Level 13 backup logic, but the rotation was changed from 5 backups to 3.

```bash
if [ "$backup_count" -gt 3 ]; then
    oldest=$(find backup -maxdepth 1 -type d -name 'arena_*' | sort | head -n 1)
    rm -rf "$oldest"
fi
```

#### Configuration parsing

The Level 12 parser was reused:

```bash
while IFS='=' read -r key value
do
    echo "Key: $key"
    echo "Value: $value"
done < settings.conf
```

### What I learned

The main lesson from Level 15 was that Bash concepts can be combined to build something more useful.

Instead of learning a completely new set of commands, I reused:

* `if` statements
* `while` loops
* `read`
* `IFS`
* `find`
* `cp`
* `date`
* `case`
* Variables
* Command substitution

and combined them into one script.

This helped me understand that scripting is not just about memorising commands. It is about combining smaller pieces of logic to automate a task.

---

# Commands and Concepts Learned in Levels 11–15

### File and directory management

```bash
mkdir
cp
cp -r
rm -rf
find
```

### System information

```bash
du
df
uptime
```

### Text processing

```bash
cut
sort
head
wc
```

### Bash scripting

```bash
if
while
case
read
echo
exit
```

### Bash features

```bash
$(...)
IFS
< file
$variable
```

### Permissions

```bash
chmod +x
```

## Overall Learning

Levels 11–15 helped me move from basic Bash commands toward writing scripts that perform useful tasks automatically.

I learned how to work with variables, conditions, loops, configuration files, backups, file searching, text processing and interactive menus.

The final boss brought these concepts together into a single script, which helped me understand how individual Bash commands can be combined to create automation.
