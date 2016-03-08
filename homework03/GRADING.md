Homework 03 - Grading
=====================

**Score**: 13 / 15

Deductions
----------

Activity 1:
Task 1: -1.25
Task 2: -0.5
Activity 2:
Task 1: -0.25


Comments
--------
Activity 1:
Task 1:
-0.5	Doesn't use automatic variables ($@,$<) when possible
	libgcd.a and libgcd.so are not necessary in TARGETS because gcd-static and gcd-dynamic depend on them
-0.25	gcd-dynamic and gcd-static should link with -lgcd
-0.5	gcd-dynamic and gcd-static should use $(LD)
Task 2:
-0.5	gcd-static doesn’t depend on any libraries. Using ldd, gcd-dynamic depends on the following (may vary by a library or two):
	linux-vdso.so.1 (0x00007ffcbbd76000)
      libgcd.so => not found
      libc.so.6 => /usr/lib/libc.so.6 (0x00007f59b1a08000)
      /lib64/ld-linux-x86-64.so.2 (0x00007f59b1dac000)	

Activity 2:
Task 1:
-0.25	Needs -std=c99 or -std=gnu99 flags
clean:
        rm -f $(TARGETS) *.o
