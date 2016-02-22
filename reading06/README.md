Reading 06
==========

1. echo "all your base are belong to us" | tr 'a-z' 'A-Z'

2. cat etc/passwd | grep '/bin/bash'

3. echo "monkeys love bananas" | sed s/monkeys/gorillas/g

4. cat etc/passwd | sed -e 's/\/bin\/bash/\/usr/\bin/\python/g' -e 's/\/bin\/csh/\/usr/\bin/\python/g' -e 's/\/bin\/tcsh/\/usr/\bin/\python/g'

5. echo "    monkeys love bananas" | sed 's/^*//g' 

6. cat etc/passwd | sed -n '/4/,/7/p' 

7. tail 

8.sort file1 > sortedFile
  sort file2 > sortedFile2
  comm sortedFile sortedFile2
