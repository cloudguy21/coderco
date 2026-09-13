Linux Permissions and Ownership
Task 3
Creating a Script

I created a Bash script called hello.sh using:

echo '#!/bin/bash\necho "Hello DevOps"' > hello.sh

The script contains a Bash shebang and prints Hello DevOps.

Making the Script Executable

I used:

chmod +x hello.sh

This added execute permission to the script.

I then ran the script with:

./hello.sh

The script successfully displayed:

Hello DevOps
Changing Ownership

I changed the owner and group of the script to root using:

sudo chown root:root hello.sh

chown means change ownership. The first root specifies the owner and the second root specifies the group.

Understanding Permissions

I used:

ls -l hello.sh

This allowed me to inspect the file's owner, group, and permissions.

Linux permissions are divided into three categories:

Owner — permissions for the file owner
Group — permissions for the file's group
Others — permissions for everyone else

The permissions use:

r = read
w = write
x = execute
Permissions Challenge

I created a file called permissions.txt:

touch permissions.txt

I then used:

chmod 644 permissions.txt

This gives the owner read and write permissions, while the group and others have read-only permission.

The resulting permission pattern is:

-rw-r--r--

The 644 represents:

6 = read + write for the owner
4 = read for the group
4 = read for others
What I Learned

This task helped me understand the difference between file ownership and file permissions. I learned how to make a script executable, change its ownership, inspect permissions, and use chmod to control who can read, write, and execute a file.