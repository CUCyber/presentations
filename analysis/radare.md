# Reverse Engineering with Radare2

By: Nick Bulischeck, Foster McLane, Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# Clone Me

```sh
$ git clone https://github.com/nbulischeck/pcode.git
```



# Tools


## Radare2

* Unix-like reverse engineering framework and command-line tools
* What can I do with it?
	- disassemble
	- debug
	- attach to gdb
	- hex editing


### Download

```sh
$ git clone https://github.com/radare/radare2
```


### Rabin2

* Get binary info!
* Command line options
	- `-z` - get data section strings
		+ `-zz` - get strings from raw bins
	- `-g` - get everything
	- `-i` - show library function calls (imports)
	- `-s` - show symbols (exports)


## Strings

```sh
$ echo "Hello World" >example.txt
$ strings example.txt
Hello World
$
```



# Your Task


## Defuse my evil bomb!

Use the executable `bomb` in the repository.


## Tackling the Bomb

* Run the binary 

```sh
$ ./bomb
```



# Level 1

* `"Level 1 Password: "`
* What happens if you enter a string?


## Strings

```sh
$ strings bbomb
/lib64/ld-linux-x86-64.so.2
stdin
printf
strcspn
getline
strcmp
Level 1 Password:
w0wlevel1
I hate reverse engineering.
But if you can do it people think you're cool.
So that's nice.. But how do I defuse this bomb?
Level 2 Password:
```


## Password

* `"w0wlevel1"`
* `rabin2 -g bomb`



# Level 2

* "Level 2 Password: "
* Strings pt 2!?


## Radare

* Radare time!
	- `-A` - run 'aa' command to analyze all referenced code
		+ `aa` - analyze all (fcns + bbs); same as running r2 with `-A`
	- `-w` - open file in write mode

```sh
$ radare2 ./bomb -A -w
```


## Disassembly

* `pdf` - print disassembled function

![disassembly](pdf.png)


### Functions

* `pdf @ sym.main`
* `pdf @ sym.level1`
* `pdf @ sym.level2`


#### `sym.level2`

![sym.level2](sym.level2.png)


#### `sym.level2`

![strcmp](strcmp.png)


## Disassembly

* `pD` - like `pd` but gets bytes instead of opcodes

![string](string.png)

```sh
$ ./bbomb
Level 1 Password: w0wlevel1
Level 2 Password: But if you can do it people think you're cool.
Enter 6 numbers:
```


### Extra

* That's a long string...

![jmp](jmp.png)



# Level 3

* Enter 6 numbers?
* Now I REALLY can't use strings `:(`


## Disassembly

* `pdf @ sym.level3`

![level3](level3.png)


## Disassembly

![loop1](loop1.png)


### Loop 1 - `str.d`

`str.d`? - How is scanf formatted?

![str.d](str.d.png)


### Loop 2

![loop2](loop2.png)


### Loop 3

![loop3](loop3.png)


## Debugging

Isn't this a job for GDB? 

How are you going to trace through this mess?


### Radare2 Debugging Cheat Sheet

* `do` - start over
* `db 0xDEADBEEF` - set breakpoint at `0xDEADBEEF`
* `dc` - run until execution
* `ds` - step, over, source line
* `dr` - cpu registers
	+ `dr 32` - show 32-bit cpu registers
	+ `dr?rax` - show `rax` register
* `dbt` - display backtrace


## Debugging

Where do we break?

![level3break](level3break.png)

![level3sbreak](level3sbreak.png)


## Debugging

![level3regs](level3reqs.png)

![level3brk](level3brk.png)


## Debugging

![debugregs](debugreqs.png)



# Level 4


## Disassembly

![level4](level4.png)
![level4imp](level4imp.png)



# Questions?
