all: is_palindrome

is_palindrome: is_palindrome.o
	gcc is_palindrome.o -o is_palindrome

is_palindrome.o: is_palindrome.c
	gcc -c -g -gdwarf-2 is_palindrome.c

clean:
	rm -f is_palindrome test *.o 

test: is_palindrome 
	./is_palindrome<is_palindrome.input | diff - is_palindrome.output


