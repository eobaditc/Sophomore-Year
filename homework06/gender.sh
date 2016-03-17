#!/bin/sh
#echo "Male,Female">resultsGender.dat
./demographics.sh | sed 1d| cut -d , -f 1-3 | awk 'BEGIN { FS = "," }; 
                                            { percentM=100* ( $2 / ($3+ $2))}; 
                                            { percentF=100* ( $3 / ($2+ $3))};
                                            { print $1"\t"percentM"\t"percentF }' >resultsGender.dat
