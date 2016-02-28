#!/bin/sh

Nflag="10"


while getopts "hn:" opt;
do
    case $opt in
        h) echo " usage: head.sh

        -n N   Display the first N lines "
            exit 1
        ;;
        n) Nflag=$OPTARG
    esac
done

    shift $(($OPTIND -1 ))
    Nflag=($Nflag)+1
    
        awk "FNR < $Nflag" 
            
