all: hello-dynamic hello-static hello-debug hello-profile 

hello-dynamic: hello.c
	gcc -rdynamic hello.c -o hello-dynamic

hello-static: hello.c
	gcc -s hello.c -o hello-static

hello-debug: hello.c
	gcc -g hello.c -o hello-debug

hello-profile: hello.c
	gcc -pg hello.c -o hello-profile

clean: 
	rm -f *o
