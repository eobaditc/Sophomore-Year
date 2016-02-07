TLDR - su
=========

Overview
--------

run a command as a different user (must know password)

Examples
--------

- run as root user 

    $su - root -c "command" 

- tart shell as a login shell (clear variables, initialize environments, change to users home directory) 

    $su -l *username*

Resources
---------

- [Man 7](http://man7.org/linux/man-pages/man8/su.1.html)
