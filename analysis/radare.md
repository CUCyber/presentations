# Introduction To RE w/ Radare2

By: Nick Bulischeck, Foster McLane, Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# Clone Me

```sh
git clone https://github.com/nbulischeck/pcode.git
```



# Tools


## Radare2

* Unix-like reverse engineering framework and commandline tools
* What can I do with it?
	+ Disassemble, debug, attach to gdb servers, hex editing

```sh
git clone https://github.com/radare/radare2
```


### Radare2 - Rabin2

* Bin Info!
* -z get data section strings
	+ -zz get strings from raw bins
* -g get EVERYTHING
* -i show library function calls (imports)
* -s symbols (exports)


## Strings

![strs](http://i.imgur.com/y2Dd0GA.png)



# Your Task

* Defuse my evil bomb!
* "bomb" in repo


## Tackling the Bomb

* Run the binary 
```sh
./bomb
```



### Level 1

* "Level 1 Password: "
* What happens if you enter a string?


#### Level 1 Cont.

![strings](http://i.imgur.com/dGyFaoN.png)
* "w0wlevel1"
* rabin2 -g bomb



### Level 2

* "Level 2 Password: "
* Strings pt 2!?
* Radare time!
```sh
radare2 ./bomb -A -w
```
	+ -A run 'aa' command to analyze all referenced code
		- aa: Analyze all (fcns + bbs) same as running r2 with -A
	+ -w open file in write mode


#### Level 2 Cont.

* pdf - print disassembled function

![pdf](http://i.imgur.com/wk99iVl.png)


#### Level 2 Cont.

* pdf @ sym.main
* pdf @ sym.level1
* pdf @ sym.level2


#### Level 2 Cont. 

![level2](http://i.imgur.com/BjhGdbm.png)


#### Level 2 Cont.

![strcmp](http://i.imgur.com/8KzvNpS.png)


#### Level 2 Cont.

* pD - like pd but gets bytes instead of opcodes
![string](http://i.imgur.com/9f5CtPP.png)
![level2answer](http://i.imgur.com/za3DUL2.png)


#### Extra

* That's a long string...

![jmp](http://i.imgur.com/Nb4kaR4.png)



### Level 3

* Enter 6 numbers???
* Now I REALLY can't use strings :(


#### Level 3 Cont.

```sh
pdf @ sym.level3
```
![level3](http://i.imgur.com/NnDza9L.png)


#### Level 3 Cont. - Loop 1

![loop1](http://i.imgur.com/YKzGuuc.png)


#### Level 3 Cont. - Loop 1 - str.d

str.d? - How is scanf formatted
![str.d](http://i.imgur.com/PcAKQT1.png)


#### Level 3 Cont. - Loop 2

![loop2](http://i.imgur.com/XLoAiyn.png)


#### Level 3 Cont. - Loop 3

![loop3](http://i.imgur.com/CuFKYW7.png)


#### Level 3 Cont.

Isn't this a job for GDB? 

How are you going to trace through this mess?


#### Radare2 Debugging Cheatsheet

* `do` - start over
* `db 0xDEADBEEF` - set breakpoint at 0xDEADBEEF
* `dc` - run until execution
* `ds` - step, over, source line
* `dr` - cpu registers
	+ `dr 32` - show 32bit cpu registers
	+ `dr?rax` - show rax register
* `dbt` - display backtrace


#### Level 3 Cont. - Debugging

Where do we break?

![level3break](http://i.imgur.com/VEElV2E.png)

![level3sbreak](http://i.imgur.com/tNpwaYd.png)


#### Level 3 Cont. - Debugging cont.

![level3regs](http://i.imgur.com/MzvyLsV.png)

![level3brk](http://i.imgur.com/GSF03L2.png)


#### Level 3 Cont. - Debugging cont.

![debugregs](http://i.imgur.com/GpRABvX.png)



### Level 4

![level4](http://i.imgur.com/1A1hkMB.png)
![level4imp](http://i.imgur.com/EzxPMsu.png)



# Questions?
