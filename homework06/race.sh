#!/bin/sh


./demographics.sh | sed 1d| cut -d , -f 1,4-10 | awk 'BEGIN { FS = "," }; 
                                            { sum = $2+$3+$4+$5+$6+$7+$8};
                                            { percentC=100* ( $2 / sum)}; 
                                            { percentO=100* ( $3 / sum)};
                                            { percentS=100* ($4 / sum)}; 
                                            { percentB=100* ($5 / sum)}; 
                                            { percentN=100* ($6/sum)}; 
                                            { percentM=100* ($7 / sum)}; 
                                            { percentU=100* ($8 / sum)}; 
                                            { print $1 "\t" percentC "\t" percentO "\t" percentS "\t" percentB "\t" percentN "\t" percentM "\t" percentU }' > resultsRace.dat
