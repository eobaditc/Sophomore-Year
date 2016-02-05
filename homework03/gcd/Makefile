CC=		gcc
CFLAGS=		-fPIC 
LD=		gcc
LDFLAGS=
AR=		ar
ARFLAGS=	rcs
TARGETS=	libgcd.a libgcd.so gcd-static gcd-dynamic

all:  $(TARGETS)

libgcd.a: gcd.o
	$(AR) $(ARFLAGS) libgcd.a gcd.o

libgcd.so: gcd.o
	$(LD) $(LDFLAGS) -shared -o libgcd.so gcd.o

gcd-static: main.o libgcd.a
	$(CC) $(CFLAGS) -static main.o libgcd.a -o gcd-static

gcd-dynamic: main.o libgcd.so
	$(CC) $(CFLAGS) main.o libgcd.so -o gcd-dynamic

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(TARGETS) *.o
