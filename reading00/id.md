TLDR - id
==========

Overview
--------

[id] print real and effective user id and groups 

Examples
--------
	$ id
	prints user id and groups 

       $ id -Z, --context
              print only the security context of the process

       $ id -g, --group
              print only the effective group ID

       $ id -G, --groups
              print all group IDs

       $ id -n, --name
              print a name instead of a number, for -ugG

       $ id -r, --real
              print the real ID instead of the effective ID, with -ugG

       $ id -u, --user
              print only the effective user ID

       $ id -z, --zero
              delimit entries with NUL characters, not whitespace;

              not permitted in default format

       $ id --help display this help and exit

       $ id --version
              output version information and exit

       Without any OPTION, print some useful set of identified information.


Resources
---------
Linux Manual 
http://man7.org/linux/man-pages/man1/id.1.html

