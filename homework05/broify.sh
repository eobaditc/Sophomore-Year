#!/bin/sh

DELIM="#"
WFlag=""

wOn (){
    # delete delimiter and trailing white space
    sed -e "s/[$DELIM].*//" -e 's/[ \t]*$//' -e 's/^[ \t]*$//' 
}

wOff (){
    # delete delimiter and trailng while space and blank lines 
    sed -e "s/[$DELIM].*//"  -e 's/[ \t]*$//' -e 's/^[ \t]*$//' -e '/^$/d'
}

while getopts "d:Wh" opt; 
    do 
        case $opt in
            d)
              DELIM=$OPTARG
              ;;
            W)
                WFlag="-W"
              ;;
            h) 
                echo "usage: broify.sh 

-d DELIM    Use this as the comment delimiter. 
-W          Don't strip empty lines. "
            exit 1
            ;;
       esac
    done

        if [ "$WFlag" == "-W" ]; then 
            wOn
        elif [ "$WFlag" == "" ]; then
            wOff
        fi
