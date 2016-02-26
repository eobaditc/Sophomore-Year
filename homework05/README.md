Homework 05
===========
Activity 1

1. The caesar.sh script begins with reading in SET1.  I implemented this using a while loop that read all lines into te porgram and sent them to a varibale SET1.  The while loop was used instead of just one read command in order for the script to work for multiple line input.  
2. I construct the target set (SET2)  in the function create2.  First, in this function there is an if statement that is true if the inputted rotation value is greater than 26.  This if statment changes the rotation value into a number from 0-26.  I then construct SET2 using a for loop which iterates through SET1.  
3.  I encrypted SET1 using a for loop.  This for loop uses the tr command and base varibales to translate the letters into the proper encryption code. 
I set a variable var which is each "i" in the for loop.  Var is echoed and then traslated.  I used base:0:13 and base 13:26 in order to account for letters that will go past z and loop to the beggingin og the alphabet.  These values are then traslated to $ROT:26 and then 0:$ROT.  I used another base variable (baseUP) to translate uppercase letters.  The variable var is then added to the end of SET2 which is continously appended to in the for loop to create the full SET2.  The ROT variable is set to whatever the uses specifies or 13 if the user specifies nothing.  The script works for all input and the test script returns a success message.  

Activity 2

1. I first fetched the data using a function I created called getData.  This uses the curl command given in the homework assignment.  Then I use a for loop that iterates through $@.  For each name in the command line the program gets the data and changes the link in getData to once that corresponds with the name in the for loop.  To extract the relevant parts of the data I used egrep and cut.  I use egrep to output things only with url and http and use cut to narrow the output down to just the http links. The usage function is called when there are no arguments and the usage is echoed.   
2/3.  I used getopts to manage the different options.  I used a while loop to get the options and then set approproite flags.  Since only shuffle or sort could be on at once I had a singular flag (Sflag) for both and it is overriden to be whichever the last command is.  THe Nflags variable takes the number for head -n (default is 10).  The default Sflag is cat which siply outputs the links as they are read in.  The command line affects the options based on the order they are entered in becuase of the Sflag containing sort or shuf but not both.  

Activity 3

1. I deleted the comments using the sed expression sed -e "s/[$DELIM].*//" where DELIM is the delimiter sent to the script through the -d command or is the default # character.  This command finds the delimiter and then deltes everything after it in that line.  
2.  I removed empty lines by first removing all white space trailing each line and removing whitespace at the end of the file.  I used the commands 's/[ \t]*//' and 's/^[ \t]*$//'.  After all the whitespace was removed I used '/^$/d' to delete any empty lines.  I used one long line of sed commands ith -e in between the sets. 
3.  The command line changes the options through an if statement in the script.  If the getopts detects a flag it uses the function wOn which does not delete the blank lines.  If the Wflag is still the default bank values then the if statement goes to the wOff function which does delete the blank lines.  
