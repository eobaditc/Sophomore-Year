Homework 03
===========
Activity 1
1. a. libgcd.so takes up 5.9K of space while libgcd.a takes up 1.4K of space (obtained using ls -lh command).  The shared library takes up more space which was surpring however since the library is shared between many exectuables it makes sense that the static library would be smaller.  
   b. gcd-static takes up 874K of space while gcd-dynamic takes up only 7.5K of space (obtained using ls -lh command).  This is becuase in a static executable the library code is embedded within the program itself so the memory space required is much larger.  

2. gcd-static depends on libgcd.a (the static library) while gcd-dynamic depends on libgcd.so (the shared library).  The static executable depends on the static library while the dynamic executable depends on the dynamic library.  

3. gcd-dyanimc was not run succesfully.  This is because the libgcd.so library that the executable depends on could not be opened.  In order for gcd-dynamic to execute the environmental variable LD_LIBRARY_PATH would need to be specified.  

4. In dynamic linking the executabe takes up much less space however the library path must be specified to tell the program where the shared library is.  Additioanly, since dyanmic exectuables do not have a preloaded library if there is any updating required the operating system only has to update certain files.  With static executables, the system would have to update every single file it contains.  There are some advantages to static linking such as the library already being in the code and the library itself taking up less memory.  If I were creating an executable I would choose for it to be a dyanimc executabe.  Dynamic executables take up less memory and are much easier to update.  

Activity 2 

1. $ wget (link from homework website) 
   $ tar xvf is_palindrome.tar.gzv

2. For debugging the is_palindrome executable I forced gcc to use the -g and the -gdwarf-2 flags.  These flags increase the size of the executable because they add debugging information into the executable.  This information allows for breakpoints to be set and for the code to be stepped through line by line. When compiled with the debugging flags the is_palindrome executable is 12K and when compiled without the flags it only takes up 2.6 K of space.   

3. Segmentation Fault: To fix the seg fault I used the gdb debugger as follows: 

$ gdb is_palindrome
* set breakpoints (ex. b main) 
* run with r< is_palindrome.input
* use 's' command to step through


   This showed that there was a seg fault in line 38.  This line containe the fgets command and I saw that the buffer was defined as "".  This struck me as unusual as the buffer should be as large as the size of the line being read in is.  I changed the buffer to buffer[BUFSIZ] so that the program runs smoothly for different length lines. The buffer was also changed from star buffer to buffer.  

Memory Leak: 

$ valgrind --leak-check=summary is_palindrome<is_palindrome.input 
	Bad permissions for mapped regions at address 0x40093C
		_IO_getline_info...
		...fgets...
		...main...
		program then listed line numbers and the error type

   The valgrind program initially produced lots of errors and after searching through them I saw that malloc appeared alot.  Then, I realized that there as no free after the malloc function which would cause the program to continually make memory however never free any that is no longer used. I added a free(sanitize) to the end of the while loop in main.  

Invalid Memory Access:
	The malloc'd size did not account for the null character so I added a '+1' to the malloc.  Ex: malloc(strlen(s)+1).  I found this using valgrind and also through class lecture. ' 
	I also used the valgrind command  and saw that the error was in everyline that called *back.  *back points to the end of the string passed to is_palindrome.  Since the function was invalidly accesing memory I assumed that the pointer as either going too far or not far enough.  After trying s + strlen(s) +1 I then concluded that the proper *back should = s + strlen(s) -1.  
	Additionally, *writer needed to be set back to 0 at the end of the sanitize function to ensure that no memory is accessed unintentially.  

   The debugged program compiles with no errors or warnings and the is_palindrome.input matches the is_palindrome.output

4.  Fixing the Invalid memory access was the hardest because it not only require knoweldge if reading the valgrind errors but the program still compiled even with this error.  This was confusing because I did not know where the error was at first until I really looked into the Valgrind output.  Then I had to test and check the proper value for *back.  To avoid this in the future, I would suggest commenting code better or not using pointers (just kidding...not really). I would also use more inuitive variables to have a better explained code.    


Exercise 3

1. $ cd /afs/nd.edu/user15/pbui/pub/bin

    execute COURIER 
    $ COURIER 
    "Hmm... you sure you put the package in the right place?" 
2. $ strace COURIER -e | stat

   This command shows that the Courier tries to open a file in tmp called eobaditc.deaddrop.   This file does not exist so the next step is to create the file. 

   $ cd /tmp
   $ touch eobaditc.deaddrop

3.  I went back to the Courier and the output was: 
	"Whoa whoa...you can't give everyone access to the package! lock it down!" 
	This led me to believe I had to change the permissions on the file so I went back to tmp. 
   $cd /tmp
   $ chmod 600 eobaditc.deaddrop
	The chmod 600 command changes the file permissions do that only the owner can read or write it.  I chose not to include 'x' in 'rwx' because eobaditc.deaddrop is a file, not an executable. 

4.  Ran the Courier again, output: 
	"What are you trying to put here, the package is the wrong size?" 

	Go back to tmp and change the file size.  I saw that the file was of size 0 (ls -l eobaditc.deaddrop) so I changed the size by adding a few lines of text into the file.  The file size is now 136.  

5.  Run Courier (yet again), output: 

	"Well, everything looks good...I'm not sure what 'Courier ' means, but I'll pass it on. " 

    Success!
