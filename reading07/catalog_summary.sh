#!/bin/sh

URL=${1:-"http://catalog.cse.nd.edu:9097/query.text"}


curl -s "$URL" | awk ' 
        /cpus/ { sum += $2 };
        /name/ { a[$2]++};
        /type/ { b[$2]++};
        END { print "Total CPUs: " sum 
            for (i in a) { sumB++ } { print "Total Machines: " sumB}
                for (j in b) { if (max<b[j]){ max=b[j]; name=j;} } {print "Most Prolific Type: " name}}'
