Homework 01
===========

Exercise 1: 

1. absolute path: cd /afs/nd.edu/user14/csesoft 


2. relative path: cd /../../user14/csesoft


3. path using ~ : cd ~csesoft


4. ln -s /afs/nd.edu/user14/csesoft csesoft

Exercise 2: 

1. 	cd /afs/nd.edu/user19
	mkdir images
	cp-r  /usr/share/pixmaps/* /afs/nd.edu/user19/eobaditc/images

2. find -type l -xtype l

   There are broken symbolic links I found this using the command above. I believe these are broken links becuase the copy command copies the file it points to rather than the symbolic link itselfi and the root is different.  This can be fixed using cp -RP. 

3. time mv /afs/nd.edu/user19/eobaditc/images /afs/nd.edu/user19/eobaditc/pixmaps
	time: .002 s

4. time mv afs/nd.edu/user19/eobaditc/pixmaps /tmp/eobaditc-pixmaps	
	time: .135 s  
	This command takes longer because the file is being moved to the temporary bin which contains the scratch space.  This directory often has a lot of clutter in it so the computer could take a while to find sufficient memory.  

5. time rm /tmp/eobaditc-pixmaps
	time: 0s
	This command basically took no time because the computer does not need to find a memory space to delete a file. 

Exercise 3

1.  ls -lh

2. ls -ltu

3. There are a total of 1937
	find . -type | wc -l

4. Yes, the folder does contain weaver and it is written by the instructor. 
	find . -name "weaver*"

5. du -sh * 
	redhat5 is the biggest file of 77M 

6. find . -type | wc -l
	768 files 
 
7. parrot_run_hdfs is the largest file 
	find ./x86_64 -type f | xargs du | sort -n

8. 1937 files have been modified 30 days or more ago
	find . -type f -mtime +30 | wc -l 

Exercise 4

1. The owner can read, write, and execute the file.  The group to which the fle belongs can read and execute the file but cannot edit it.  Everyone else in theworld can only execute the file.  

2. a. mode: rw------- command: chmod 600
   b. mode: rwxrwx--- command: chmod 770 
   c. mode: rwxr--r-- command: chmod 744
   d. mode: --------- command: chmod 000

3.  If there are no permissions on the file, only the root user can delete the file.  

Exercise 5

1. Each folder has a different 'adiklrw' value after the name of the user or group that have permission to the file.  r means the user/group listed can read the file contents, l means they can list the files and subdirectories, a means they can change the entries, d means they can delete files, i means they can add files, w means they can modify the content of the files, and k means they can set read locks or write locks on the files. 
	Home Directory: 
	Normal rights:
	  nd_campus l
	  system:administrators rlidwka
	  system:authuser l
	  eobaditc rlidwka
	Public:
	Normal Rights:  
	  nd_campus rlk
	  system:administrators rlidwka
	  system: authuser rlk
	  eobaditc rlidwka
	Private: 
	  system:administrators rlidwka
	  eobaditc rlidwka


2. rwxrwrwx are the Unix permissions. When creating the file eobaditc.txt the error message "cannot touch `eobaditc.txt': Read-only file system" shows up.  This is because only the root user can access the rwxrwxrwx permissions.  

3.  fs setacl -clear -dir . -acl system:administrators all 

Exercise 06
1-3.  The file permissions are not the same becuase of the different octogonal numbers used.  World1.txt can right and write from all users, world2.txt can read from all users and write from the owner, and world3.txt can read from the owner and write from all users.  None of the files can be executed becuase they are text files.   The umask effect changes the permissions for the file created next.  This can be helpful when wanting to create files with different permissions quickly and efficiently.  


