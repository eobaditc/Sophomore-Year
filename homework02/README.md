Homework 02
===========
Exercise 1

1. #create workspace on source machine 
   $ mkdir /tmp/eobaditc-workspace 

   #generate 10MB file ful of random data 
   $ dd if =/dev/urandom of=10MB bs=1024 count=10240

   #generate 10 hard links to 10MB file
   $ ln 10MB data(#)

   #create workspace on target machine 
   $ mkdir /tmp/eobaditc-workspace 

2.  The total disk usage is 110M which is not surprising becuase each of the 11 files and/or links are all of size 10M (size obtained from ls -lh command). 

3. The total disk usage (obtained through du -h command )is 101M which is surprising because each of the links are 10M which would add up to 100M however there is an extra 1M used on the disk.  

4. # transfer data files using scp
	$  scp [data]* eobaditc@student01:/tmp/eobaditc-workspace eobaditc@student02:/tmp/eobaditc-workspace

  # transfer data files using sftp
	$   stfp eobaditc@student02:/tmp/eobaditc-workspace < do.txt 
	$ do.txt: mput data*

  # transfer daya files using rsync
	$ rsync [data]* /tmp/eobaditc-workspace eobaditc@student02:/tmp/eobaditc-workspace

5. Scp and sftp both copy every file when they are run multiple times, which works but can be inefficient.  When rsync runs, if there is no data on the target machine then it will copy the data but if only a small part of the data has chaned rsync will only copy the changed part, not recopy all of the data.  This is helpful becuase is saves time and internet usage.   

6.  I preferred the rsync command becuase it was more simple than the sftp command and only required me to type in my user password once, where as I had to type it in twice for scp.  Rsync also seems  more intuitive and user friendly than scp and sftp and was much faster.  

Exercise 2
1. Scan 'xavier.h4x04.space for HTTP port 
	$ nmap -Pn  xavier.h4x0r.space

	Output: 
	PORT     STATE SERVICE
	22/tcp   open  ssh
	8888/tcp open  sun-answerbook
	9111/tcp open  DragonIDSConsole
	9876/tcp open  sd

2. 	As you can see there are 2 active ports within the 9000-10000 range.  To check if the port was a HTTP server, I used command...

	$curl xavier.h4x0r.space:9111

	$ curl xavier.h4x0r.space:9876

	output: 
 if you seek the ORACLE, you must query  |
| the DOORMAN at /{netid}/{passcode}!     |
|                                         |
| To retrieve your passcode you must      |
| decode the file at                      |
| ~pbui/pub/oracle/${USER}/code using the |
| BASE64 command.                         |
|                                         |
\ Good luck!                              /


3. This led me to believe that port 9876 contains the oracle.  I then used commands: 

	$ cd pbui/pub/oracle/eobaditc
	$ more code
	output:
	MTAzMTgxMGQyZjBiYzJjNWZiYjRkNmI2NjE3NzQ4NWQ=

4. 	decode using command: 
	$ base64 -d code
	output:
	1031810d2f0bc2c5fbb4d6b66177485d

5. 	query doorman:
	$ wget xavier.h4x0r.space:9876/eobaditc/1031810d2f0bc2c5fbb4d6b66177485d

6. 	open file to view message: 
	$ vi 1031810d2f0bc2c5fbb4d6b66177485d
	output
	 Ah yes, eobaditc... I've been waiting   \
| for you.                                |
|                                         |
| The ORACLE looks forward to talking to  |
| you, but you must first retrieve a      |
| secret message from the SLEEPER.        |
|                                         |
| He can be found in plain sight at       |
| ~pbui/pub/oracle/SLEEPER... You will    |
| need to wake him up and then signal him |
| to HANGUP his connection. If he         |
| recognizes you, he will give you the    |
| message in coded form.                  |
|                                         |
| Once you have the message, proceed to   |
| port 9111 and deliver the message to    |
| the ORACLE.                             |
|                                         |
| Hurry! The ORACLE is wise, but she is   |
\ not patient!                            /
 -----------------------------------------
         \

7. 	find sleeper
	$ cd ~pbui/pub/oracle
	run sleeper in background
	$ SLEEPER &
	kill sleeper
	$ kill -1 15384 (PID)

	output: 
	code for oracle: cmJvbnF2Z3A9MTQ1NDAzNDE5OQ== 

8. 	proceed to port 9111
	$telnet xavier.h4x04.space 9111 
	output: 
	"Hello who my you be" 
	eobaditc
	"MEssage" 
	code from above 
	"Reason?"
	this was hard!
	"Congrats you reached the enf of this journey!"

	Then, a bunch of green letters occupied the terminal until the message "Connection terminated by foreign host." was displayed. 

	
