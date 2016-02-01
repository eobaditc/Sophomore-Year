Reading 03
==========

1. $ strings bin/ls

2. $ ldd bin/ls

3. $ strace -c ls

4. $ gdb hello-debug //open debugging with excecutable
   $ r //run the program with debugging
   $ q //quit

5. Compile hello.c with debugging on: 
   $ gcc hello.c -g -o hello
   Run Memcheck 
   $ valgrind --leak-check=yes hello-dynamic

6. $ gprof hello-profile > hello-profile.output

   The process with the highest percentage of time usage indicates it is the largest bottleneck this information can be found in the call graph and in the flat profile.  
