#!/usr/bin/env python2.7

import sys
import getopt
import os

#Globals
NUM=10

#Usage Function

def usage(status=0):
    print '''usage: {} [-n NUM] files

    -n NUM  print the first NUM lines instead of the first 10'''.format(os.path.basename(sys.argv[0]))
    sys.exit(status)

# Parse command line options

try:
    opts, args = getopt.getopt(sys.argv[1:], "hn:")
except getopt.GetoptError as e:
    print e
    usage(1)

for o, a in opts:
    if  o == '-n':
        NUM= int(a)
    else:
        usage(1)

if len(args) == 0:
    args.append('-')

#Main
counter=1
count=int(counter)

for path in args:
    if path == '-':
        stream=sys.stdin
    else:
        stream=open(path)

    f = stream.readlines()

    for line in f:
        if count > NUM:
            sys.exit
        else:
            print line,
            count=count+1
