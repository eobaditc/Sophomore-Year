#!/bin/sh


./roll_dice.sh -r 1000 |  awk '
        /1/ { sumOne++ }; 
        /2/ { sumTwo++ }; 
        /3/ { sumThree++ }; 
        /4/ { sumFour++ }; 
        /5/ { sumFive++ }; 
        /6/ { sumSix++ }; 
        END { print "1\t"  sumOne  
            print "2\t" sumTwo 
            print "3\t" sumThree
            print "4\t" sumFour
            print "5\t" sumFive
            print "6\t" sumSix}' > results.dat
