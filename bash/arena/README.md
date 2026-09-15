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
