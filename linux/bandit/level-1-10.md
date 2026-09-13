OverTheWire Bandit — Levels 1–10

I used OverTheWire Bandit to practise Linux commands and problem-solving. My focus was understanding why each command was used rather than memorising commands or passwords.

Level 1 → 2

The password was in a file beginning with -.

What I learned: Filenames beginning with - can be interpreted as command options, so they may need explicit path handling.

Level 2 → 3

The password was in a filename containing spaces.

What I learned: Spaces separate command arguments, so spaces in filenames need to be handled correctly.

Level 3 → 4

The password was in a hidden file.

ls -a

What I learned: -a shows all files, including hidden files.

Level 4 → 5

One of several files contained human-readable text.

What I learned: When working with multiple files, I need to identify which files contain useful readable data.

Level 5 → 6

The password was in a file with a specific size.

find . -size 1033c

What I learned: find can search for files based on properties such as size. c represents bytes.

Level 6 → 7

The file had specific ownership and size requirements.

find / -user bandit7 -group bandit6 -size 33c

What I learned: find can combine multiple conditions to narrow down a search.

Level 7 → 8

The password was next to the word millionth in data.txt.

What I learned: grep searches inside files for specific text.

Level 8 → 9

The password was the only line that appeared once.

sort data.txt | uniq -c

What I learned: sort groups identical lines, while uniq -c counts them. The pipe passes output from one command to another.

Level 9 → 10

The password was hidden among human-readable strings.

strings data.txt

What I learned: strings extracts readable text from files containing binary or non-readable data.

Level 10 → 11

The password was Base64 encoded.

base64 -d data.txt

What I learned: Base64 is encoding, not encryption. -d tells the command to decode the data.

Overall Reflection

The first 10 Bandit levels helped me apply Linux fundamentals in practical situations.

I learned how to search for files, inspect their contents, filter information and combine commands using pipes.

Most importantly, I am learning to understand what a command does and why I need it, rather than simply memorising commands.

Next: Bandit Levels 11–20.