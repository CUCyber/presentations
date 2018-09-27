## Intro to Networking and Info Gathering

By: Nick Bulischeck, Weston Belk, Foster McLane, Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## Intro to Networking


### IP Addresses, Ports, and Subnets

Note:
Review basic network topology (IP Addresses, Ports, Subnets)


#### IP Addresses


##### What is an IP Address?

* An IP address is a numerical label assigned to each device connected to a computer network that uses the Internet Protocol for communication.
* An IP address serves two principal functions
	- host or network interface identification
	- location addressing

Note:
In the same way that your mailman needs an address to deliver mail to your house, computers need an address to know where to send data to talk to each other.


##### IPv4 and IPv6

* IPv4
	- 32-bit Addresses
	- Written in dot-decimal notation
	- Private and Public Addresses
		+ Private - 192.168.1.1
		+ Public - 130.127.151.120
* IPv6
	- 128-bit Addresses
	- Written in the form of eight groups of four hexadecimal digits
	- 2001:0db8:85a3:0000:0000:8a2e:0370:7334


#### Ports


##### What is a Port?

* A port is a number that designates a communication channel
* A service is a long running application that listens on a particular address and port
* Most services have a default port, but can be reassigned if need be.

Note:
Firewalls (eg. UFW and network firewalls) are able to block communications by port rather than allow all or no traffic.
For example, the service secure shell (SSH) listens on port 22, Apache (a web server) listens on port 80 (the default HTTP port) and possibly 443 (the default HTTPS port), and DNS services listen on port 53 (the default DNS port).


##### Sockets

* A process can refer to a socket using a socket descriptor, a type of handle.
* Unlike ports, sockets are specific to one node; they are local resources and cannot be referred to directly by other nodes.
* Further, sockets are not necessarily associated with a persistent connection (channel) for communication between two nodes, nor is there necessarily some single other endpoint.

Note:
For example, a datagram socket can be used for connectionless communication, and a multicast socket can be used to send to multiple nodes.


#### Subnets


##### What is a subnet?

* A subnet is a logical partition of an IP network into multiple, smaller network segments.
* It is typically used to subdivide large networks into smaller, more efficient subnetworks.


##### CIDR Notation

* CIDR notation is a shorthand for discussing blocks of IP address.
* 192.168.1.1/24


##### Subnetting

![subnetting](subnetting.png)


### TCP and UDP


#### TCP

* Transmission Control Protocol is a standard that defines how to establish and maintain a network conversation via which application programs can exchange data.
* TCP provides reliable, ordered, and error-checked delivery of a stream of octets (bytes).


#### TCP

* TCP is defined as being:
	- Connection-oriented
	- Stream-based
	- Increased network overhead

Note:
Connection-oriented: TCP has a three-way handshake that is performed to establish a connection. This is in the form SYN, SYN-ACK, ACK.
Stream-based: Packets are transmitted in order (“1... 2... 3...”) in a continuous stream. If a packet fails to transmit, it will be retransmitted.
Increased network overhead: TCP packets have a large header which creates a lot of overhead.


##### Examples of TCP

Note:
Example uses of TCP are World Wide Web (WWW), E-mail, File Transfer Protocol, Secure Shell, peer-to-peer file sharing, and streaming media applications.


### UDP

* User Datagram Protocol is an alternative communications protocol to TCP used primarily for establishing low-latency and loss-tolerating connections between applications on the internet.
* UDP provides checksums for data integrity, no handshake, and no guarantee of delivery,
ordering, or duplicate protection.


### UDP

* UDP is defined as being:
 - Connectionless
 - Message based
 - Real-time
 - Order-less

Note:
Connectionless: Connections do not need to be established for UDP packets to be transmitted.
Message based: “Fire and forget” motto.
Real-time: Time-sensitive applications often use UDP because dropping packets is preferable to waiting for packets delayed due to retransmission, which may not be an option in a real-time system.
Order-less: It does not matter in what order the packets of a UDP connection arrive.


#### Examples of UDP

Note:
An example use is VoIP or online gaming.



## Intro to Info Gathering


### Topics

* Why is information gathering important?
* What should you be looking for?
* How to organize your information.
* What tools are there to help you find things?


### Why is Info Gathering Important?


#### Attacking

* You don't know what you don't know
* Increases surface area for attack
* Gives you the ability to organize an attack more effectively

Note:
* You never know when a bit of information will be handy!


#### Defense

* You don't know what you don't know
* Knowing what is on your network
* Knowing who is on your network
* How an action would impact your network and the domino effect that follows

Note:
* Knowing what/who is on your network allows you to respond more quickly


##### Example

* A new exploit for Adobe Flash comes out, how would you respond?

Note:
* First you would want to find all of the servers that are running the version of Adobe Flash affected by this vulnerability.
* If you have a list pregenerated you can respond immediately, and possibly before damage is done.


### Recording Your Findings


#### Boxes on the Network

* IP(s)
* Firewall ports open and closed
* Services running
 - Service Name
 - Service Version
 - Service Purpose
 - Service Port(s)
 - Interface(s) listening


#### Individual Machines

* User permissions and shell
* Group permissions
* Directory permissions
* Purpose of the machine
* Running services


#### Reporting

* Report how you secured the machine.
 - Before/What are the security risks
 - Steps taken
 - After (Result)
* Take screenshots
* Save scan outputs
* Save interesting URLs
* Save account lists


#### Record your actions

* If you are able to compromise something, record how
* Will ensure you are always moving forward
* Could save you a lot of legal trouble

Note:
* Keeps you from doing the same thing multiple times
* If you are doing pentesting on a network, you want a paper trail of what you did so that you can back up your claims if they ever come under fire
* You want reproducable results, this is a science


## Organization


### Tools for Info Organization

* KeepNote (Linux/Kali)
* OneNote (Windows)
* Evernote/Google Keep
* RecordMyDesktop/OBS
* Excel
* Vimwiki/Emacs Org-mode
* etc.


### Tips for use

* Make sure to categorize your data well
* Don't just stick everything in one document
* Keep data up to date
* Use tags to speed up searching #findme

Note:
* All the tools in the world are useless if you do not have a good workflow.
* Proper use can speed up your process.



## Gathering/Demo


### Tools for Info Gathering

* nmap
* dmitry
* Wireshark
* Metasploit
* Nikto
* And More!


## Nmap
* Nmap is a great too for enumerating your network and finding devices and services that are running
* nmap -A 10.20.18.25 (to start)


## Dmitry
* Dmitry is a powerful whois tool
* dmitry clemson.edu


## Wireshark
* Wireshark is a user friendly packet sniffing tool for monitoring your network

Note:
* Please dont use this on public networks
* TCP port 1234
* If you wanted to capture ssh traffic what would you use?


## Metasploit
* You may have heard that metasploit is just an offensive toolkit but it has recon packages available to it.

Note:
* Versioning of software
* ssh versioning:
* use auxiliary/scanner/ssh/ssh\_version
* set RHOST
* run


## Nikto
* A great starting tool for gathering information on webservers
* Gives a lot of information on webservers

Note:
* Nikto -h 10.20.18.25
* Walk through some of the information



# Questions?
