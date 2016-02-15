#!/bin/sh

for i in $1/*;
do
    if [ -h "$i" ]; then 
        link=$(readlink -f $i)
        echo $link
    fi
done
