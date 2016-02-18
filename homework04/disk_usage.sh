#!/bin/sh

DUFlags=""

HEADFlags=""


while getopts "an:" opt;
    do
        case $opt in
            a)
                DUflags=-a
            ;;
             n)
                 HEADFlags=-n$OPTARG
            ;;
        esac

    done

    
    shift $(($OPTIND -1 ))

    for directory in $@; 
         do
             du -h $DUflags $directory 2>/dev/null | sort -hr | head $HEADFlags         
         done

