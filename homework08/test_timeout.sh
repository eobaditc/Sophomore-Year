#!/bin/bash

if [ ! -x $file ]; then
    echo "Test failed, not an executable"
    exit 1
fi

shebang=$(cat timeout.py | head -n 1 | grep -o python2.7)
if [ $shebang != 'python2.7' ]; then
    echo "Test failed on she-bang test"
    exit 1
fi

./timeout.py -h 2  >&results1.txt
usage=$(cat results1.txt | head -n 1 | grep -o Usage:)
if [ "$usage" != 'Usage:' ]; then
    echo "Test failed on usage test"
    rm results1.txt
    exit 1
fi
rm results1.txt

for N in 1 2 3 4; do
    ./timeout.py -t 5 sleep $N && echo Success > results1.txt
    echo Success > results2.txt
    result=$(diff -u results2.txt results1.txt)
    if [ $result ]; then
        echo "Test failed on expected success with -t $N"
        exit 1
    fi
    rm results1.txt results2.txt
done


for N in 2 3 4 5; do 
    ./timeout.py -t 1 sleep $N || echo Failure >results1.txt
    echo Failure > results2.txt
    result=$(diff -u results2.txt results1.txt)
    if [ $result ]; then
        echo "Test failed on expected failure with -t $N"
        exit 1
    fi
    rm results1.txt results2.txt
done 

./timeout.py -v sleep 5 >results1.txt

output=$(cat results1.txt | wc -l)
if [ $output -gt 15 ] || [ $output -lt 1 ]; then
    echo "Test failed on verbose output"
    rm results1.txt
    exit 1
fi

echo "timeout.py test successful!"
