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


## A Word on Ethics...

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

* Terminal-based
* Radare2-gui
* Very powerful
* Hard to remember commands
* Free!


### Pwndbg/Peda

* Both free
* Both do the same sort of dynamic analysis
* Pwndbg is constantly developed, Peda inactive af


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

![puts](puts.png)


### Objdump

+	`-d` disassemble
+	`-s` full dump
+	`-t` dump symbols and `strip`
+	`-r` and `-R` print relocations


## Questions
