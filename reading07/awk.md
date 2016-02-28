TLDR - awk
==========

Overview
--------

pattern scanning and processing language.  *more than just a command* you can do loops, if statements, and print statements in one awk script 

Examples
--------

- Printing Specific Fields

    to find a specific WORD 
    $ awk '/WORD/ {print $1}'
    this finds the WORD and prints the first column of the output 

- Modifying FS
    FS- current field separator used to denote each field (default is whitespace)
    $ awk '{FS="\n"}'
    this changes the seprator to the newline character

- Using BEGIN and END

    $ awk 'BEGIN {code}
            code
            code
         END {usually a print statement}'
    BEGIN executes before anything else is run
    END executes after all commands have been run 

- Using pattern matching

    $ awk '/PATTERN/'

- Using special variables such as NF and NR
    NF- number of fields in the current record 
    NR- number of the current record
    $ awk [print NR, NF}
    will print number of record in each number of field 

- Using associative arrays

    $ awk '{ arr[$1]++ }'
    will tally the first column 
    can print the array with  for loop 
        for (i in arr) {
            print arr[i], i
        }

Resource
---------

- [Man 7](http://man7.org/linux/man-pages/man1/gawk.1.html)
- [igital Ocean](https://www.digitalocean.com/community/tutorials/how-to-use-the-awk-language-to-manipulate-text-in-linux)
- [wk in 20 Mins](http://ferd.ca/awk-in-20-minutes.html)
