## Metasploitable

By: Adam Van Scyoc

CU Cyber


* Please fill out this google form (if you feel like it [check the discord Red Team channel]):
https://forms.gle/5TtPguxxkNTn3Sry6
* Please join our discord server if you ain't/hasn't yet:
https://discord.gg/f7ZcC7z
* Please join CUCyber mailing list: (come see an officer at some point or email CU-CYBER-OFFICERS@lists.clemson.edu)
* Please see Weston if you have not been added to the CUCyber "Lab" yet or have no idea what that is


#### You Can Find These~~ _the Metasploit Presentation_ Online (but not the Red Team Training presentations - yet)

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



#### First things First

<small>
Starting Metasploit can take a couple minutes. Before we begin, go ahead and start it now.
From a terminal:
1. Start the database 

`systemctl start postgresql`

2. Start the Metasploit Framework Console 

`msfconsole`

If you get an error like 

```WARNING: No database support: could not connect to server: Connection refused
	Is the server running on host "localhost" (::1) and accepting
	TCP/IP connections on port 5432?
could not connect to server: Connection refused
	Is the server running on host "localhost" (127.0.0.1) and accepting
	TCP/IP connections on port 5432?``` 

... you need to start the Postgres database (see step 1 [yes even for MS5])
</small>


### Second things... second

<small>
For those that are confident with metasploit after last week, go ahead and start pwning 
the Metasploitable image!
1. VPN into lab (if you don't have Lab vpn cred's please see Weston or @ him in Discord): e.g.: 
`openvpn --config avanscy.ovpn`

2. 
`ssh rtt-ms2.vm.cucyber.net -p 1337`

3. 

```Welcome to rtt-ms2.vm.cucyber.net!
Available Commands:
  status  start  stop  restart  ping  quit
```

**start**
</small>


### Fourth things four... wait

Don't forget NMAP!
We need to use NMAP to get a list of ports on the remote host (in our case, __rtt-ms2.vm.cucyber.net__) that could potentially be vulnerable programs.

Start with:

`nmap -A rtt-ms2.vm.cucyber.net`

... and then explore more NMAP scan options.


### Fifth things fifth?!?!!!

<small>
Major Metasploit module for enormous Windows vulnerability "BlueKeep" dropped on Friday night.
* "BlueKeep (CVE-2019-0708) is a security vulnerability that was discovered in Microsoft's Remote Desktop Protocol implementation, which allows for the possibility of remote code execution. "
* Windows XP, Windows Vista, Windows Server 2003, Windows Server 2008, Windows Server 2008 R2, Windows 7 and all recent versions of the operating system up to Windows 10
* "On 6 September 2019, an exploit of the __**wormable**__ BlueKeep security vulnerability was announced to have now been released into the public realm"
</small>

note: 
3rd bullet point is not small for some reason


## What is Metasploit?

Note:
Metasploit is a penetration testing platform that enables you to find, exploit, and validate vulnerabilities.


## Purpose of Metasploit

"What’s the point between an exploit in Metasploit and and a random script? i.e. what is metasploit providing and the exploit code?"


1. Centralization of Exploits, Scanners and Payloads
2. Interoperabiity of Exploits and Payloads - specify your own payload and customize for given application
3. Make searching for exploits - either by target machine type or by (Common Vulnerabilities and Exposures) or other vulnerability disclosure categorization formats.
4. Provides JSON-RPC interface for automation and extensibility - external modules
5. Standardizes the exploitation process

note: One of the comments that I got on the quiz asked an imortant question.


### Module types

* Everything in Metasploit is a module
* 6 types of modules
    - auxiliary
    - exploit
    - payload
    - post
    - encoder
    - nop

note: Primarily intereseted in auxiliary, exploit and payload for now.


### Auxiliary

* Modules that are good for information gathering
* Port scanning
* Version detection
* Network traffic analysis


### Exploits

* Weaponized code that targets a vulnerability on a system
* Only works on systems that match the specific exploit criteria


### Payloads

* A payload is what Metasploit uses to execute specific actions on a remote system post-exploitation
 - Open a remote shell
 - Meterpreter session



### Search Filters

* Searching with the database is very fast
* Search fields
    - author
    - type
    - name
    - platform
    - bid,cve,edb,osvdb,ref



## Using Metasploit


### Using a module

* `use <exploit>` will load the exploit and allow you to use it

```metasploit
use <path to exploit>
```

* `info` command is like a man page for metasploit commands

```metasploit
info <path to exploit>
```


### Firing Off an Exploit!

* After you select an exploit to use, you must configure the setting to match your target

```metasploit
show options
```


#### Show options basics

* `RHOST` - Remote host, typically an IP address or a DNS name of the target
* `RHOSTS` - Same as `RHOST` but can define multiple targets
* `RPORT` - The port to attack on the remote host, this is typically configured to be the default for the service, but can be changed just in case it is not default
* `RPORTS` - Same as `RPORT` but can define multiple targets



## Exploits behind the scenes

An in-depth discussion of vulnerability discovery and Binary Exploitation is outside the scope of this class, but we can take a quick look at a very basic exploit from a challenge from TokyoWestern CTF. 
For more about this, come do CSAW CTF this Friday after we watch Hackers!

[demo]

note:
1. gauge audience familiarity w/ C and ASM
2. Show vulnerable code and explain why vulnerable. Mention gcc flags. Mention both vuln's
3. Show exploit code. Show disassembled shellcode
4. Run program through socat port 9000, demonstrate running exploit as python script. Explain what it means to "pop a shell"
5. Show attempt at MS module. Mention normally written in Ruby - general purpose, interpreted programming language. Explain metadata



## Resume hacking Metasploitable2

<small>
For those that are confident with metasploit after last week, go ahead and start pwning 
the Metasploitable image!
1. VPN into lab (if you don't have Lab vpn cred's please see Weston or @ him in Discord): e.g.: `openvpn --config avanscy.ovpn`

2. `ssh rtt-ms2.vm.cucyber.net -p 1337`

3. 
```Welcome to rtt-ms2.vm.cucyber.net!
Available Commands:
  status  start  stop  restart  ping  quit
```

**start**
</small>


## Path to Success:

1. `nmap -A rtt-ms2.vm.cucyber.net -p 1337`
2. Pick an open port. Research the service that's running on it. Look for known vulnerabilities with that service.
3. Find an appropriate Metasploit module - either by googling the service, or search Metasploit db itself.
4. Configure exploit: `show options -> set`
5. Run exploit: `run`


## Quick demo of entire Metasploit exploit process

[demo]

note: May or may not work.


# END
