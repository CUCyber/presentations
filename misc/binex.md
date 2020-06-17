# Binary Exploitation

By: Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## C Recap


### Hello World


### Memory in C

Note:
Binary exploitation really comes down to abusing memory objects that exist within a binary - whether that's a buffer on the stack, an integer


#### Stack, Heap, or Static?


##### Stack

* variables are allocated and freed automatically
* the stack it not limitless – most have an upper bound
* the stack grows and shrinks as variables are created and destroyed
* stack variables only exist whilst the function that created them exists

Note:
What is it called when you exceed the memory limits of the stack? Stack Overflow!


##### Heap

* the heap is managed by the programmer
* malloc (and friends) and free
* the heap is large, and is usually limited by the physical memory available
* the heap requires pointers to access it


##### Static

* Global variables
* "Static" variables

Note:
* Static memory persists throughout the entire life of the program, and is usually used to store things like global variables, or variables created with the static clause.




## Binary Security


### Stack Canary

* Random integer that is placed before every return pointer

* Prevents machine code from being executed after a buffer overflow


### NX

* No Execute/Nonexecutable bit

* Prevents machine code (shellcode) from being run on the stack


### PIE

* Position Independent Executable

* Randomizes the binary's base address


### ASLR

* Address Space Layout Randomization

* Randomizes stack, heap, and library addresses


## Exploits


### Integer Overflow

* Abuses how computers represent integers in memory to wrap an integer into the negatives

Note:
In math, 1+1+1+1... approaches infinity, but for a single integer on a computer it will always be bounded by the size of data that one register (or datatype) can hold


### Buffer Overflow

* Abuses a C-style buffer to overwrite a value (or values) stored in memory

* Perfect when there are no binary protections in place


### Code Reuse

* Code reuse attacks perform malicious behavior by using existing bits of code inside a program

* Bypasses NX


#### Return Oriented Programming

* Code reuse attack that uses `ret` gadgets to form malicious code execution chains


#### Jump Oriented Programming

* Code reuse attack that uses `jmp` gadgets and a dispatch table to form malicious code execution chains


#### Pure-Call Oriented Programming

* Code reuse attack that uses `call` gadgets to form malicious code execution chains


### Format String

* Uses an incorrect call to printf to leak stack values

* Can be leveraged to bypass the Stack Canary, PIE, and ASLR


### Heap

* Tcache, House of X, etc.



## Demo


### Buffer Overflow 1

* host: ada3.computing.clemson.edu

* port: 4000


### Buffer Overflow 2

* host: ada3.computing.clemson.edu

* port: 5000


### Buffer Overflow 3

* host: ada3.computing.clemson.edu

* port: 6000



## Questions?
