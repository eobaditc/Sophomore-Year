#!/bin/sh

export PATH=$PATH:/afs/nd.edu/user15/pbui/pub/bin/

welcome(){

    echo "welcome to cowsay $USER" | cowsay

}

waiting(){
    
    echo "Too slow, bye" | cowsay
    exit 0
}

hangup(){

    echo "you hungup on me..." | cowsay
    exit 0
}

terminate(){
    
    echo "terminating me? well thats just rude. bye" | cowsay
    exit 0
}

welcome

for i in 0 1 2 3 4 5 6 7 8 9 
    do
         sleep 1
         trap hangup SIGHUP
         trap terminate SIGINT SIGTERM
         if [ $i -eq 9 ]; then 
             waiting
         fi
    done

exit 0
