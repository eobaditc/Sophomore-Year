#!/bin/sh

Rflag="10"
Sflag="6"

while getopts "hr:s:" opt;
do
    case $opt in
        h) echo " usage: roll_dice.sh [-r ROLLS -s side]
        
        -r ROLLS    number of rolls of die (default: 10)
        -s SIDE     number of sides on die (default: 6)"
            exit 1
        ;;
        r) Rflag=$OPTARG
        ;;
        s) Sflag=$OPTARG
        ;;
    esac
done

for i in $(seq 1 $Rflag); do 
    echo $(shuf -i 1-$Sflag -n1)
done
