# Binaries: Static Analysis

By: Max Harley

CU Cyber


## Let's learn assembly and other stuff stuff about binaries!

By: Max Harley

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



## Intro

* Why analyze binaries?
* Static vs. dynamic analysis?
* Why do static analysis?

![How you feel after learning reverse engineering](iamagod.png)


## Strings

```txt
$ strings /bin/ls
$FreeBSD: src/bin/ls/util.c,v 1.38 2005/06/03 11:05:58 dd Exp $
\\""
"3.13.3.7"
"take screenshot"
"remove all files"
@(#)PROGRAM:ls PROJECT:file_cmds-251
1@ABCFGHLOPRSTUWabcdefghiklmnopqrstuvwx
bin/ls
Unix2003
```



# Binaries ARE (mostly) Reversible


## Assembly

```txt
$ objdump -D /bin/sh | less

0x100001a51   750e          jne 0x100001a61
0x100001a53   488d35863a00. lea rsi, [rip + 0x3a86] ; 0x1000054e0
0x100001a5a   bf01000000    mov edi, 1
0x100001a5f   eb0a          jmp 0x100001a6b
```


## Introduction to Intel assembly - How is member stored?

* Registers `eax`, `ebx`, `eip` - Useful for fast operations
    ```x86
    mov eax, 0x9
    ```
* RAM - Useful for storing data
    ```x86
    mov dword [ebp - 0x8], 0x9
    ```
* Things in brackets are evaluated. These are typically memory addresses.


## Registers

* General purpose registers
	- `eax` - Arithmetic
	- `ebp` - Base Pointer
* Specific purpose registers
	- `eip` - Instruction Pointer
	- `eflags` - Process


## Important Instructions

* `mov y, x`
* `add y, x`
* `sub y, x`
* `imul y, x`
* `idiv x`
* `or y, x`
* `xor y, x`
* `inc x`
* `dec x`


## Simple Assembly

```x86
0x1   mov dword [ebp-0xc], 0x15
0x2   mov dword [ebp-0x10], 0x7
0x3   mov dword [ebp-0x14], 0x0
0x4   mov edx, dword [ebp-0xc]
0x5   mov eax, dword [ebp-0x10]
0x6   add eax, edx
0x7   mov dword [ebp-0x14], eax
```


## C Equivalent

```c
int x = 21;
int y = 7;
int total = 0;

total = x + y;
```


## Control Flow

* `jmp [address]`
* `cmp x, y`
* `je [address]`
* `jne [address]`
* `jgt [address]`
* `jle [address]`
* `ret`


## Compare and Jump Assembly

```x86
...
0x15   cmp dword [ebp - 0x18], 0x1
0x16   jne 0x19
0x17   mov eax, 0x4
0x18   jmp 0x1a
0x19   mov eax, 0x5
0x1a   ret
```


## Who's that C construct?

```x86
0x0   mov dword[ebp-0x4], 0
0x1   mov dword[ebp-0x8], 0
0x2   jmp 0x5
0x3   add dword[ebp-0x4], 1
0x4   add dword[ebp-0x8], 5
0x5   cmp dword[ebp-0x4], 9
0x6   jle 0x3
```

![Who's that C construct?](whosthatcconstruct.png)


## C Equivalent

```c
int total = 0;
int i;

for (i = 0; i < 9; i++) {
	total += 5;
}
```



# Now on to real analysis!


## Necessary tools and files

* [http://pof.eslack.org/tmp/IOLI-crackme.tar.gz]()
* Radare2
	- `pacman -S radare2`
	- `apt install radare2`
	- [https://github.com/radare/radare2]()


## Radare2

* Radare - The vim of reverse engineering
* (Almost) all CLI
* SUPER powerful. It does debugging, disassembling, patching, and much more
* Scriptable with JS, Python, and Go
* [More than a typical multi-platform](http://radare.today/posts/radare-0-9-9/)
* [Cheat Sheet](https://github.com/pwntester/cheatsheets/blob/master/radare2.md)


## Getting started with Radare2

* `r2 [binary]`
* Commands build on each oter
* Commands are self-describing by using "?" at the end


## Begin Radare2 with sample file

```txt
$ r2 ./IOLI-crackme/bin-linux/crackme0x00
```


## Analyzing / Disassembling

```txt
> afl        # Doesn't do much, does it?
> aa
> afl        # Now, something should output
> s main
> pdf        # OR pdf@main
```


![The power of Radare](thepowerofradare.png)


## Visual Mode

```txt
> V             # Enter visual mode
    > p         # Go to the next screen
    > {h,j,k,l} # Move around (vim keybindings!)
    > .         # Go to EIP
> VV            # Function viewer
> q             # Quit to visual mode
> q             # Quit visual mode
```


## Debugging

```txt
$ r2 -AAAA -d [name of binary]
```

```txt
> d? # and dr?        # Just so you know the commands we will be using
> db main             # Sets a breakpoint at the main function
> dc                  # continue or start running if at 0x00000000
> drt {all,flg,16,32} # Show registers
> dr?eax              # Show value of 'eax'
> dr eax=0x00000001   # Set register 'eax' to 1
> dc                  # Continue the program
```


## Patching

```txt
> pdf@main            # Print the main function
> s 0x08048470        # Go to the specified address
> wa jmp 0x08048480   # Set opcodes
> pdf@main            # Laugh
> dc                  # Run the program, input anything
```



## More Resources

* Practical Malware Analysis - Michael Sikorski
* Rootkits: Subverting the Windows Kernel - Greg Hoglund
* [http://crackmes.de/]()
* [http://virusshare.com/]()
* SANS FOR610



# Questions?
