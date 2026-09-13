# Process Management

## 1. Viewing Processes

### `ps aux`

Displays a snapshot of currently running processes.

Important columns:

* `USER` — user who owns the process
* `PID` — Process ID
* `%CPU` — CPU usage
* `%MEM` — memory usage
* `COMMAND` — command/program running

### `ps aux | grep nginx`

Uses a pipe (`|`) to send the output of `ps aux` into `grep`.

`grep nginx` filters the output and shows lines containing `nginx`.

A pipe allows the output of one command to become the input of another command.

## 2. Monitoring Processes

### `top`

I used:

```bash
top
```

This displays a live, continuously updating view of running processes and system resource usage.

Unlike `ps aux`, which provides a snapshot, `top` updates the information in real time.

I pressed `q` to exit `top`.

### `htop`

I installed `htop` using:

```bash
sudo apt install htop
```

I then ran:

```bash
htop
```

`htop` is an interactive process monitoring tool that provides a more user-friendly view of running processes and system resource usage.

I pressed `q` to exit `htop`.

## 3. Background Processes

### Running a Process in the Background

I used:

```bash
sleep 100 &
```

The `&` runs the command in the background instead of keeping the terminal occupied.

The shell displayed:

```text
[1] 42319
```

`[1]` is the shell job number, while `42319` is the Process ID (PID).

### Checking Background Jobs

I used:

```bash
jobs
```

This displayed the background job:

```text
[1] + running sleep 100
```

The `jobs` command shows processes that are being managed as jobs by the current shell.

## 4. Foreground and Background Jobs

### `fg`

I used:

```bash
fg %1
```

`fg` brings a background job into the foreground.

`%1` refers to job number 1. It is different from the PID.

After bringing the process into the foreground, I used `Ctrl+C` to terminate it.

### `bg`

I also tested:

```bash
bg %1
```

This is used to resume a stopped or suspended job in the background.

When I tried it after terminating the process with `Ctrl+C`, the shell reported that there was no such job because the process had already been terminated.

I also tried `bg %1` on a job that was already running in the background, which returned:

```text
bg: job already in background
```

This showed me that `bg` is intended for stopped jobs rather than jobs that are already running in the background.

## 5. Terminating Processes

### `kill`

I created another background process and used:

```bash
sleep 100 &
```

I then terminated it using its PID:

```bash
kill 42319
```

The `kill` command sends a signal to a process. By default, it sends a termination signal to the specified PID.

I then used:

```bash
jobs
```

The job was no longer listed because the process had been terminated.

### `killall`

I also tested:

```bash
killall sleep
```

This attempts to terminate processes based on their name rather than using a specific PID.

The command returned an `Operation not permitted` message for a `sleep` process owned by another user. This showed me that I cannot terminate another user's process without the required permissions.

## 6. Process Management Concepts

The main concepts I learned were:

* `ps aux` — displays a snapshot of running processes
* `ps aux | grep nginx` — filters process information using `grep`
* `top` — provides a live view of processes
* `htop` — provides an interactive process monitor
* `&` — runs a command in the background
* `jobs` — lists jobs managed by the current shell
* `fg` — brings a background job to the foreground
* `bg` — resumes a stopped job in the background
* `%1` — refers to shell job number 1
* `PID` — identifies a specific process
* `kill PID` — terminates a specific process
* `killall` — terminates processes by name

## What I Learned

This task helped me understand how Linux manages running processes. I learned how to view and monitor processes, run commands in the background, move jobs between the foreground and background, identify processes using their PIDs, and terminate processes using `kill` and `killall`.

I also learned the difference between a shell job number and a process ID, and how permissions can affect the ability to terminate processes owned by another user.
