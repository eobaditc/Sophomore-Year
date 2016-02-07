Reading 04
==========

1. $ tar -xzf file.tar.gz
	the tar command with the xf flags extracts all files from the archive and the z flag filters through gzip.  The z flag is necesary because of the '.gz'.  
2. $ tar -cvzf data.tar.gz /*path*/data
	using the tar command with the cvxf flags I would then specify the path to the directory and then the directory name.  

3. $ unzip file.zip 

4. $ zip -r data.zip data

5. $ dpkg --install file_VVV-RRR_AAA.deb
	'VVV' is the version number, 'RRR' is the Debian Revision number, 'AAA' is the Debian architecture number. 

6. $ yum install *file* 
	where *file* is the package name 

7. $ pip install *file* 
	where *file* is the package name 
	to run this command it is necesary to have pip and setuptools installed and updated to the most recent version 
	you could also create a virtual environment which allows Python packages to be installed in an isolated location, rather than being installed globally ,to do this the commands would be: 
	$ pip install virtualenv
	$ virtualenv <DIR>
	$ source <DIR>/bin/activate 

8. $curl -F 'content=<-' URL 
	the < command takes the content of the file and posts it to the URL.  If you wanted to paste the file as a file you could use the @ comand instead.  

9. $ su - root -c "command"
	where "command" is the command being run
	Can also run multiple commands as the root user by doing: 
   $ su -root 
	as long as the password is correct   
