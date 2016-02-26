#!/bin/sh


ROT=${1:-13}
SET1=""
SET2=""
base=abcdefghijklmnopqrstuvwxyz
baseUP=ABCDEFGHIJKLMNOPQRSTUVWXYZ

while getopts "h" opt;
do
    case $opt in
        h) echo " usage: caesar.sh [rotation]

This program will read from stdin and rotate (shift right) the text by the specifiec rotation.  If none is specified, then the default value is 13. "
            exit 1
    esac
done

create2(){
 SET2=""
 if [ "$ROT" > "26" ]; then
    ROT=$((ROT%26))
 fi 

 for i in $SET1; do
     var=$(echo $i | tr "${base:0:13}${base:13:26}" "${base:$ROT:26}${base:0:$ROT}" | tr "${baseUP:0:13}${baseUP:13:26}" "${baseUP:$ROT:26}${baseUP:0:$ROT}")
    SET2=$SET2$(echo " ")$var
    done
}

while read line; do
    SET1=$line
    create2
    echo $SET2
done
