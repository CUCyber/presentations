# CTF

## A Hacker's Playground

By: Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## What is CTF?


## CTF

* CTF stands for Capture The Flag
* Security competitions where you solve hacking challenges
* Solo or as a team
* Goal is to capture flags


**FLAG{THIS_IS_A_FLAG}**


### Example

* Web server listening on port 8080
* Navigate to the webserver
* Exploit a vulnerability
* Retrieve a flag



### CTF Styles


#### CTF Styles

* Jeopardy
* Attack and Defense
* Mixed


#### Jeopardy


![jeopardy-style](jeopardy-style.png)


#### Jeopardy

* Pwnables (Binary Exploitation)
* Reverse Engineering
* Steganography
* Cryptography
* Forensics
* Web
* Trivia/Quiz


#### Attack and Defense

![attack-and-defense](attack-defense.png)


#### Attack and Defense

* Teams vs Team
* Vulnerable services


#### Mixed

* Format varies
* Wargame w/ tasks (UCSB iCTF)



### Why should I do a CTF?


#### Job Types

* Red Team Penetration Tests - Bin Ex
* Black-box Testing - Bug Bounty
* Code Audits
* Consulting - Designing secure software
* Crypto Reviews - RSA, Algorithms
* Risk Analysis
* Developers


#### It's a Challenge!

* Typical challenges - strengthen fundamentals
* Esoteric challenges - think outside the box
* Failure



### How do I get into CTFs?


#### How do I get into CTFs?

* ctftime.org - Upcoming
* Try one single challenge
* Look at write-ups
* Analyze your mistakes


#### Fun CTFs

* Infosec CTF
* ctf.wcsc.usf.edu
* Hackerfire
* pwnable.kr
* Hack The Box


#### Youtube

* LiveOverflow
* GynvaelEN
* JackkTutorials



### I want to make my own!


#### Platforms

* FBCTF (Jeopardy)
* CTFd (Jeopardy)
* iCTF from UCSB (Attack/Defense)
* InCTF (Attack/Defense)



### Challenge Time!


#### Binary Exploitation

```C
char buffer[BUF_LEN];
gets(buffer);
```


Buffer Overflow!


##### Gets

![gets](buffer-overflow.png)


#### Binary Exploitation

```C
char buffer[BUF_LEN];
fgets(buffer, BUF_LEN, stdin);
printf(buffer);
```


Format String Bug!


#### Binary Exploitation

```C
char buffer[32];
memset(buffer, 0, 32);
fgets(buffer, 50, stdin);
return;
```


Return-Oriented Programming!


#### Crypto

RkxBR3tCQVNFNjR9Cg==


##### Base 64

![base64](base64.png)

FLAG{BASE64}


#### Crypto

SYNT{EBG13_VF_IREL_RNFL}


FLAG{ROT13_IS_VERY_EASY}


#### Web

iRobot - WCSC

![irobot](irobot.png)


##### Robots.txt

![robotstxt](robotstxt.png)


#### Web

```PHP
$supplied_pass = $_GET['pass'];
$correct_pass = get_password_somehow();
if (strcmp($supplied_pass, $correct_password) == 0) {
  echo $flag
} else {
  echo 'Sorry, incorrect link';
}
```


##### PHP!!!

* foo.bar/?pass[]=a
* `strcmp()` returns `NULL`
* `==` succeeds because `NULL == 0` in PHP



### Questions?
