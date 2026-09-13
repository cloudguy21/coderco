# Text Processing

## Task 5

### Searching with `grep`

I used `grep` to search for specific text within files.

```bash
grep "error" /var/log/syslog
```

This searches `/var/log/syslog` for lines containing the word `error`.

I also used:

```bash
grep -i "failed" /var/log/auth.log | wc -l
```

`-i` makes the search case-insensitive, so it matches `failed`, `Failed`, `FAILED`, etc.

The pipe (`|`) sends the output of `grep` to `wc`.

`wc -l` counts the number of lines returned.

The command returned:

```text
0
```

This means there were no matching lines in the file.

### Recursive Searching with `grep`

I used:

```bash
grep -r "TODO" ~/projects/
```

`-r` means recursive. It tells `grep` to search through the specified directory and its subdirectories.

The command returned:

```text
grep: /home/eagle/projects/: No such file or directory
```

This happened because the example `~/projects/` directory does not exist on my system.

### Using `awk`

I used:

```bash
ps aux | awk '{print $1, $11}'
```

`ps aux` displays the running processes on the system.

The pipe (`|`) sends that output to `awk`.

`awk` is a text-processing tool that works with text line by line and field by field.

In this command:

* `$1` — first field, normally the process owner
* `$11` — eleventh field, beginning of the command
* `print` — tells `awk` what to output

Because `ps aux` contains many processes, the command produced many lines of output.

I also used:

```bash
cat /etc/passwd | awk -F: '{print $1, $6}'
```

`cat /etc/passwd` displays the contents of the `/etc/passwd` file.

`-F:` tells `awk` to use `:` as the field separator.

The command prints:

* `$1` — username
* `$6` — home directory

This produced many lines because Linux contains multiple system and user accounts.

### Using `sed`

I used:

```bash
sed 's/old/new/g' file.txt
```

`sed` is a stream editor used to process and modify text.

In this command:

* `s` — substitute
* `old` — text to search for
* `new` — replacement text
* `g` — replace all occurrences on each line

The command returned:

```text
sed: can't read file.txt: No such file or directory
```

This happened because `file.txt` was an example filename from the assignment and does not exist on my system.

I also used:

```bash
sed -n '10,20p' file.txt
```

Here:

* `-n` — prevents `sed` from automatically printing every line
* `10,20` — selects lines 10 through 20
* `p` — prints the selected lines

This also returned a `No such file or directory` error because `file.txt` does not exist.

### Piping Chains

I used a chain of commands:

```bash
cat /var/log/syslog | grep "error" | awk '{print $1, $2, $3}' | sort | uniq
```

This demonstrates how multiple commands can be connected using pipes.

The commands work in sequence:

1. `cat` outputs the contents of `/var/log/syslog`.
2. `grep "error"` keeps lines containing `error`.
3. `awk` extracts the first three fields from each matching line.
4. `sort` sorts the resulting lines.
5. `uniq` removes duplicate lines.

The pipe (`|`) passes the output of one command to the next command.

### What I Learned

This task helped me understand how Linux commands can be combined to search, filter, extract, sort, and process text.

I learned that:

* `grep` searches for matching text.
* `wc -l` counts lines.
* `awk` processes text field by field.
* `sed` processes and transforms text.
* `sort` sorts output.
* `uniq` removes duplicate lines.
* Pipes (`|`) allow the output of one command to become the input of another.

I also learned that commands can be chained together to perform more advanced text-processing tasks without needing to manually process the output.
