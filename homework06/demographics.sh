#!/bin/sh
echo "Year,Male,Female,Caucasion,Oriental,Hispanic,AfricanAmerican,NativeAmerica,Multiple,Undeclared"

for i in 1 3 5 7 9 11; do

    cFlag="-f$i"

        Female=$(cat demographics.csv | cut -d , $cFlag | grep -o 'F' | wc -l)
        Male=$(cat demographics.csv | cut -d , $cFlag |  grep -o 'M' | wc -l)
        Year=$(cat demographics.csv | cut -d , $cFlag | awk NR==1)

        cFlag="-f$(( $i +1 ))"
        Caucasion=$(cat demographics.csv | cut -d , $cFlag | grep -o 'C' | wc -l)
        Oriental=$(cat demographics.csv | cut -d , $cFlag | grep -o 'O' | wc -l)
        Hispanic=$(cat demographics.csv | cut -d , $cFlag | grep -o 'S' | wc -l)
        AfricanAmerican=$(cat demographics.csv | cut -d , $cFlag | grep -o 'B' | wc -l)
        NativeAmerican=$(cat demographics.csv | cut -d , $cFlag | grep -o 'N' | wc -l)
        Multiple=$(cat demographics.csv | cut -d , $cFlag | grep -o 'T' | wc -l)
        Undeclared=$(cat demographics.csv | cut -d , $cFlag | grep -o 'U' | wc -l) 

    echo "$Year,$Male,$Female,$Caucasion,$Oriental,$Hispanic,$AfricanAmerican,$NativeAmerican,$Multiple,$Undeclared" 
done

