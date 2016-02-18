Homework 04
===========
Activity 01

1. a. I handled setting variables through the use of the or (:-) command.  This says that if the variable has been set use the value it has been set to but if not use the default value.  The defualt value is the value after the :- in the variable definition.  I used a for loop to iterate through all files that matched the variable SUFFIXES.  I used the commands for i in star $SUFFIXES which tells the shell to look for all files that end in the same value as SUFFIXES.  In this case, that was all .c files.  The VERBOSE variable was handled through an if statement that uses the bracket form of the test command.  This if statement says if verbose is 1 then echo the gcc command, if not then the program prints nothing to stdout. I terminated the program early using an additional if statement.  This if statement comes before all other statements and says that if the program cannot compile then exit before doing any of the remaining commands.  

2. Make and bake are very similar once the programs are actually written.  Bake.sh required much more time to make however would be useful is multple .c files needed to be complield.  Make however, would be useful when files with .h and .cpp compenents needed to be compiled together.  In the future I will most likely use make because it is more customizable and more practical in the sense of time management. 

Activity 02

1.  I parsed the command line arugments using the getopts command.  This command is implemented in a while loop.  The loops sends the arguments to the variable opt which enters a case statement.  If there are no options opt is simply nothing and the program goes right to the du commands.  This case statement sets different flags for each variable (DUFlags and HEADFlags).  Then, these flags are set and used in the du command. The HEADFlags uses OPTARG which passes the number used in the -n command.  The program uses shift to proccess each directory argument.  Shift moves to the last commands that it does recognize which would be the directory.  The -1 moves it back to the first directory and saves these in the directory variable used in the for loop. 

2.  Surprisingly, the part of the program that took up the most code was just reading the flags and setting them.  This was also the hardest part just because I had never heard of getopts before and it took a lot of time to get the right syntax.  I initially thought that the actual du command would take the most space however this was only one line of code. 

Activity 03

1. The taunt shell script handles different signals with different functions.  The functions are welcome, waiting, hangup, and terminate.  The script uses a for loop to count how long the program has been waiting.  It uses traps to process if the user runs SIGHUP, SIGINT, or SIGTERM, commands and sends the script to the appropriote function.  The program timesout when the for loop iterates 10 times (10 seconds).  It then moves to the waiting function, displays the message, and exits.  The script uses the environmental $USER variable to customize the  welcome message. 

2.  Once I learned the proper syntax I started to prefer writing shell script over writing C programs.  I think the syntax is more intuitive and its very  cool that you can use commands that are already built into the terminal within the script.  I will continue to write scripts to make longer commands much easier to execute.  There is indeed a learning curve to shell scripts but I think once this is past they are easier than C programs.  
