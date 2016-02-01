TLDR - strace
=============

Overview
--------

runs specified command until it exists.  traces system calls and signals

Examples
--------

- count tie, calls, and errors for each system and then report a summary (if used with -f only aggregate totals) 

    $strace -c

- how debugging information 

    $strace -d

Resources
---------

- [Man 7](http://man7.org/linux/man-pages/man1/strace.1.html)
