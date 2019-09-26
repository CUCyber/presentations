# WebApp Enumeration

By: Adam Van Scyoc

CU Cyber


* Please join our discord server if you ain't/hasn't yet:
https://discord.gg/f7ZcC7z
* Please join CUCyber mailing list: (come see an officer at some point or email CU-CYBER-OFFICERS@lists.clemson.edu)
* Please see Weston if you have not been added to the CUCyber "Lab" yet or have no idea what that is


#### You Can Find Some Presentations Online (but not the Red Team Training presentations - yet)

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>

Still working on getting Red Tream Training presentations online. Check discord.


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


## Web App Exploitation

* Viewing source code
* Enumerating Web Apps - finding all directories
* Running Server vulnerability scanners
* Crawling a webpage

note: 
Viewing source code - client-side only, what types of vulnerabilities can be found client-side?



## Viewing Source Code

[cucyber.net demo]

* es-lint and XSS


### Enumerating Web Apps

What does it mean when NMAP lists a service that it found on a scan as HTTP or HTTPS?
http://rtt-ms2.vm.cucyber.net:80


## Dirbuster

* Comes pre-installed on Kali
https://tools.kali.org/web-applications/dirbuster
[demo]


### Burpsuite Spider

* iBurp Spider is a tool for automatically crawling web applications. While it is generally preferable to map applications manually, you can use Burp Spider to partially automate this process for very large applications.
* Could technically be categorized as a "crawler" as well.


## robots.txt

* What is Google's indexer?
* Text file that tells Google site indexer how to handle certain sub-directories.
* Some sites opt out of Google indexing.
* For sites with robots.txt, provides good breakdown of sub-directories.



### Web Server Vulnerability Scanning


## Nikto

* Free and Open Source
* Not the greatest - older vulnerabilities, false positives
* IDS evasion and obfuscation
* Installed by default on Kali


## Arachni

* Free and Open Source
* Better maintenance than Nikto - very current
* Can be run in clustered mode, with mutliple computers running scans
* Great Web UI


## Nessus

* Paid License
* Possibly best maintained of all the Web Server Vulnerability Scanners
* Used by CCIT CSOC (if you bring a website online in clemson.edu domain, automatically scanned with Nessus)


## Burpsuite Scanner

* Also paid license
(I've never tried it)



### Crawling a webpage

* Burpsuite Spider (again)
* Metasploit auxiliary/crawler/msfcrawler module


## Metasploit msfcrawler

[demo]


## HTTrack

[demo]

## Try these out yourself!

* Don't forget to log in to lab!
* everyone navigate to
`http://rtt-ms2.vm.cucyber.net`
