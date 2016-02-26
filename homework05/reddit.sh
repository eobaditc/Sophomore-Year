#!/bin/bash

SFLAG="cat"
Nflags="-10"

usage(){

    echo "usage: reddit.sh [options] subreddits...

       -r     Shuffle the links 
       -s     Sort the links
       -n N   Number of links to display (default is 10)"

}


getData(){
    curl -s "http://www.reddit.com/r/$name/.json" | python -m json.tool
}

while getopts "rsn:" opt; 
    do
        case $opt in
            r) 
                SFLAG="shuf"
                ;;
            s) 
                SFLAG="sort -d"
                ;;
            n) 
                Nflags=-n$OPTARG
                ;;
        esac
    done

    shift $(($OPTIND -1 ))

 if [ "$#" -eq 0 ]; then
     usage
 fi
    
    for name in $@; 
        do
        getData | egrep '\"url\": \"http:.*\"' | cut -d"\"" -f4 | $SFLAG  | head $Nflags 
        done

