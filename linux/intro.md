# Introduction to Linux

By: Nick Bulischeck & Foster McLane

CU Cyber with thanks to Clemson ACM


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is a "Linux"


## Short History

* Started by Linus Torvalds for lack of free kernels
* Created with a Unix-like userspace
* Monolithic architecture, i.e. batteries built-in


## So Linux is a Kernel...


* There are multiple operating systems (distributions or distros) based on Linux
* Major differences include:
    - Supported desktop environments (e.g. GNOME, KDE, Xfce)
    - Package managers that define how software is installed and updated
    - Core services (e.g. systemd, cron, avahi)


## What are my options?


### RedHat

RedHat Package Manager or RPM

* RedHat Enterprise Linux
* CentOS
* Fedora


### Debian

DEB package manager

* Debian
* Ubuntu (Xubuntu, Kubuntu, etc.)
* Kali


### Others

* **OpenSUSE** - focus on OS innovation
* **Arch Linux** - focus on customization and bleeding edge
* **Gentoo** - focus on ~~decent into madness~~ source based customization and optimization



# Environment


## Filesystem Hierarchy


* `/` - root directory below which everything is mounted


* `/dev` - device nodes (e.g. block devices, character devices, TTY devices)
    - e.g. `/dev/sda1` for first partition of first drive
    - e.g. `/dev/random` for random data
    - e.g. `/dev/zero` for sourcing null bytes
    - e.g. `/dev/null` for sinking any data
* `/proc` - process hierarchy with metadata and data sections
* `/sys` - kernel parameters that can be read-only or read-write


* `/tmp` - temporary files that get cleared every boot (e.g. sockets, locks)
* `/var` - variable runtime data (e.g. logs, changing metadata)


* `/usr/bin` - system executables
* `/usr/lib` - system libraries


* `/home` - normal user files
* `/mnt` - where external drives or otherwise non-essential drives are generally mounted


## Shells
### (non-graphical)


### bash

* Default shell for most distributions
* Arcane syntax due to tumultuous history
* Generally what scripts will be written for


### zsh

* A more configurable bash compatible shell
* Generally not installed by default


### fish

* Hip new shell with
    - automatic completion (with man page parsing)
    - history and file awareness
    - syntax highlight by default
    - easy configuration
* Generally not installed by default


## Environment Variables


* `PATH` - directories to search when using an unresolved command
* `SHELL` - default shell
* `USER` - current user


* `TERM` - current terminal type
* `DISPLAY` - socket for X connections
* `PWD` - current directory


# Package Management


These generally need super-user/root permission. More on that later.


## APT
### (Debian/Ubuntu/Kali)


#### Update package list

`apt update`

#### Search package list for expression

`apt search <expression>`

#### Install package

`apt install <package>`


#### Fix broken dependency graph

`apt install -f`

#### Upgrade all packages

`apt upgrade`


## DNF
### (Fedora)


#### Search package list for expression

`dnf search <expression>`

#### Install package

`dnf install <package>`

#### Upgrade all packages

`dnf upgrade`


## Yum
### (RHEL/CentOS)


#### Search package list for expression

`yum search <expression>`

#### Install package

`yum install <package>`

#### Upgrade all packages

`yum upgrade`



# Command Line Basics


## Navigation


#### Show current directory

`pwd`

#### Change current directory

`cd <dir>`


#### List content of current or specified directory

`ls [dir]`

#### Show a tree-like output of directory and all subdirectories and files

`tree <dir>`


## Shorthand

* `~` can be used as shorthand for the current user's home directory

`ls ~`

* Appending `&` to the end of a command runs it in the background

`sleep 60 &`


## File Management


#### Remove a file

`rm <file>`

#### Recursively remove a directory

Includes all subdirectories and files

`rm -r <dir>`


#### Move/Rename a file

`mv <from> <to>`

#### Copy a file

`cp <source> <dest>`

#### Output file to terminal

`cat <file>`


## Programs and Flags


* To run a command on the given file in the current directory

`<cmd> <file>`

* To run a command on the given file from the root directory

`<cmd> /<path>/<file>`


* To use a short or long flag

`<cmd> -h` or `<cmd> --help`

* To give a flag an argument

`<cmd> -f <arg>` or `<cmd> --file <arg>`


## Redirection


* To direct output (stdout) of one program and feed it to the input (stdin) of another

`<cmd1> <args1> | <cmd2> <args2>`


* To count words in "this is a sentence"

`echo this is a sentence | wc -w`

* To list all files in `/home` and subdirectories and use a pager for easy reading

`find /home | less`


* To direct output (stdout) to a file

`<cmd> <args> > <file>`


* To write "this is a sentence" to a file named `hi`

`echo this is a sentence > hi`


* To direct input (stdin) from a file

`<cmd> <args> < <file>`


* To count works in the file named `hi`

`wc -w < hi`


## History

* You can use arrow keys to go up and down to previous commands


## Configuration

* Generally found in an `*rc` file
* Bash configuration is in `.bashrc`


## Archives


#### Create archive

`tar czf <output file> <source files...>`

#### Extract archive

`tar xvf <input file>`


## Editors

* `nano` - low learning curve, generally installed by default
* `vim` - higher learning curve, more efficient, generally installed by default


## Help

#### Show manual page for command

Very Helpful!

`man <cmd>`

#### Show program built-in help

(if available)

`<cmd> --help`



# Permissions


## Users and Modes

* Each file is owned by a user and group
* Each file has a bitmask of modes based on a matrix of user, group, others and read, write, execute


#### Set user and group

`chown <user:group> [-R] <path>`


* To set owner of `/home/cyber` and all subdirectories and files

`chown cyber:cecas -R /home/cyber`


#### Set permission mask

`chmod [u|g|o][+|-][r|w|x]`


* To remove read, write, and execute access from group owner and other users

`chmod og-rwx /home/cyber`


## Sudo

* Used to run commands as another user or as the system account, root


* To use the root account to install a package

`sudo apt install build-essential`



# Remote Access


## Secure Shell (SSH)

* To open a terminal shell on the remote host resolved by `host`

`ssh user@host`



# Further Resources

* [Linux Journey](http://linuxjourney.com/) for learning Linux-fu
* [ExplainShell.com](http://explainshell.com/) to see the component parts of a command



# Questions?
