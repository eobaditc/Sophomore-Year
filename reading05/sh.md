TLDR - sh
=========

Overview
--------

sh- used for riting shell scripts in bash 
shell scripts are txt file that cotnain sequences of commands and can be run by the shell


Examples
--------

- variables: you can set variables in shell scripts (jut like other programs)

    $ var= variable

- capturing STDOUT

    $ echo "stuff"
    $ printf to print formatted 


- if statement: same use as C/C++ if statements

    $ if [conditional] && [other condition] ;then
        commands
    elif (else if) [conditional] || [conditional]; then
        commands 
    fi 

- case statement

    $case $variable in
        [1-6]*)
            commands
        ;;
        [7-8]*)
            commands
        ;; 

- for loop

    $ for i in [1-10]; 
        do 
            commands
        done

- while loop

    $ while [0 -lt 4 ] 
        do 
            commands
        done

- function; useful to break down complicated programs 

    $ function_name (){

    } 

- trap; allows you to execute a command when a signal is received by script 

    $ trap arg signals
    **cannot trap SIGKILL** 

Resources
---------

- Bash Begginners Guide  tldp.org/LDP/Bash-Beginners-Guide/ 

- Linux Command.org linuxcommand.org/lc3_writing_shell_scripts.php

