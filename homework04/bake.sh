#!/bin/sh

SUFFIXES=${SUFFIXES:-".c"}
CC=${CC:-"gcc"}
CFLAGS=${CFLAGS:-"-std=gnu99 -Wall"}

VERBOSE=${VERBOSE:-0}
 

    for i in *$SUFFIXES;
        do
            target=$(basename $i $SUFFIXES)
            if  ! $CC $CFLAGS -o $target $i; then
                exit 1
            fi

            $CC $CFLAGS -o $target $i
            if [ "$VERBOSE" == "1" ]; then
                 echo "${CC} ${CFLAGS} -o ${target} ${target}.c"
            fi 
            
        done
