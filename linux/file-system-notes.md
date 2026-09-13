# Linux File System Navigation

## Task 2

### Navigating the File System

I used `pwd` to check my current working directory, `ls` to view files and directories, and `cd` to move between directories.

I also used `ls -lah` to view detailed information, including hidden files and human-readable file sizes.

I used `touch` to create a file and `mkdir -p` to create directories.

I've used `cp` command to copy a file from one directory to another.

I've used `mv` to rename a file that i've misspelled and i've used `rm` to delete a file.

Reading Files

I used cat to display the contents of /etc/passwd.

I used head -n 20 to display the first 20 lines of /etc/services.

I used tail -f to follow /var/log/auth.log and monitor new entries in real time. I used Ctrl+C to stop following the file.

What I Learned

This task helped me understand how to navigate the Linux file system and manage files and directories using the command line. I also learned how to read system files and monitor log files.

Commands Used

pwd — shows the current working directory.
ls — lists files and directories.
ls -lah — shows detailed information, including hidden files and human-readable sizes.
cd — changes the current directory.
touch — creates an empty file.
mkdir -p — creates directories and any required parent directories.
cp — copies files.
mv — moves or renames files.
rm — removes files.
cat — displays file contents.
head -n — displays the first specified number of lines.
tail -f — continuously follows new content added to a file.

Problems and Lessons

One mistake I made was using ~/etc/passwd instead of /etc/passwd. I learned that ~ refers to my home directory, while /etc/passwd is located under the root directory.