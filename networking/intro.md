# Introduction to Networking

By: Mackenzie Binns & Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# Core Concepts


## Terminology & Notations

* IP Addresses (v4 and v6)
* Ports (TCP and UDP)
* Subnet Mask & CIDR Notation


## Network Models

* TCP/IP
* OSI
* TCP vs. UDP


## Default Gateways

* Routing
* Home vs. Enterprise


## Core Network Protocols

* Domain Name System (DNS)
* Address Resolution Protocol (ARP)


## Tools

* nmap
* ss
* ip



# Terminology & Notations


## Terminology


### IP - Internet Protocol

* a suite of protocols for identification and addressing of connected computers

* subnet - a block of IP space


#### IPv4 - IP Version 4

* has a 32-bit address block (4 billion addresses)
* private and public addresses
	- private - 192.168.1.1
	- public - 130.127.151.120

Note:
We've run out of IPv4 addresses because they were handed out in large blocks. We use black magic (a.k.a. NAT) to keep everything working.


#### IPv6 - IP Version 6

* has a 128-bit address block (a bunch of addresses)
* 2001:db8::1

Note:
IPv6 address space is larger than visible stars in the universe. Explain double colons for IPv6 address.


### Ports

* port - a number that designates a communication channel
* service - a long running application that listens on a particular address and port


### Notations

* subnet mask notation - 255.255.255.0
* CIDR notation - 0.0.0.0/24

Note:
The 0.0.0.0 part is replaced with the network IP address space.


### MAC - Media Access Control

* MAC address - address of your network interface card (NIC) provided by the manufacturer

Note:
MAC addresses cannot be changed, but can be spoofed on a lot of network hardware.



# Network Models

Note:
Encapsulation is key here! Every layer is enveloped by the lower layer.


## TCP/IP Model

* Layer 1 - Network Interface Layer
* Layer 2 - Internet Layer
* Layer 3 - Transport Layer
* Layer 4 - Application Layer


## OSI Model


### Layer 2 - Data Link Layer

* responsibilities
	- getting data to the physical layer (i.e. ethernet cat-6 cabling)
	- error detection
	- hardware addressing (i.e. framing)


#### Media Access Control (MAC) Sublayer

* defines MAC addresses
* controls access to network media (e.g. network drive)


#### Local Link Control (LLC) Sublayer

* does error and flow control
* handles layer 2 congestion


### Layer 3 - TCP/IP Layer

* responsibilities
	- routing
* can send arbitrary data
* grouping of data is called packets
* uses addresses to communicate

Note:
Route selection finds the "best" path, not necessarily the shortest path.
Higher layers (than 3) determine format and further structuring.
Where layer 2 uses MAC addressing, layer 3 uses IP addressing. (lead-in to ARP later)


### Layer 4 - Transport Layer

* responsibilities
	- error detection
* TCP & UDP


### Layer 7 - Application Layer

* responsibilities
	- takes requests from users and applications to lower layers (sender side)

Note:
Sender works from top down; receiver works from bottom up.
What kind of processes do you think appear here? Chrome and Word do not live here, but it does include applications that allow Chrome and Word to access networked information.


## TCP vs. UDP


### TCP - Transmission Control Protocol

* connection-oriented protocol
	- three-way handshake
* stream based
* increased network overhead

Note:
TCP "guarantees" delivery of information.
Explain what stream based means. Note that it is not Netflix.
Why would TCP have increased network overhead? TCP has a 14 header blocks and a 20 byte header
Explain SYN, SYN-ACK, ACK.


### UDP - User Datagram Protocol

* connectionless
* message based
	- "fire and forget"
* realtime and orderless

Note:
UDP is a connectionless protocol.
For Netflix because it is realtime video streaming.
Why a connectionless (something that doesn't guarantee your message gets there) is good for Netflix? Use frame numbers in explanation.



# Default Gateways


## Routing

* routers know how to forward packets to another network or within its local area network (LAN)
* your default gateway is where your computer sends its packets

Note:
That other network is almost always a wide area network (WAN)
Show 'ip route' output.


## Home vs. Enterprise


### Home

* cable box is generally your default gateway in a home network


### Enterprise

* have multiple default gateways for spatial locality of routing and for subnetting
* most of the routers do not directly route to the internet or even route the internet at all

Note:
Most enterprise networks designates a subnet as a "closed circuit" to reduce attack surface of certain systems.



# Core Network Protocols


## Domain Name System (DNS)

* the internet equivalent of a phone book
* knows how to go from google.com to 143.215.193.237
* knows how to send email to gmail.com

Note:
For now, just remember that it can translate a human-readable form to an IP address that an application can use to connect to another computer.


## Address Resolution Protocol (ARP)

* resolves IP addresses into MAC addresses
* entries are cached on your local system and any network equipment between the connection
* a layer 2 protocol

Note:
When a system attempts to connect to another host. It uses the IP address to determine if it's on the local network (remember CIDR notation and subnetting). If so, it looks at the ARP cache to find the MAC address of the system and uses that to communicate. If the ARP table does not hold the IP address, your computer sends a broadcast message and a computer with that IP address may respond.
Use the 'ip neighbour' command to view your ARP cache.



# Tools


## nmap - Network Map

* 'nmap 192.168.1.101'
* 'nmap scanme.nmap.org'
* 'nmap -p 22 192.168.1.101'
* 'nmap -sT 192.168.1.101'
* 'nmap -sU 192.168.1.101'
* 'nmap -sV 192.168.1.101'
* 'nmap -A 192.168.1.101'


## ss - Socket Statistics

* 'ss'
* 'ss -l'
* 'ss -tu'
* 'ss -lp'
* 'ss -lpn'


## ip


### ip address

* 'ip address'
* 'ip a'
* 'ip a show dev wlp8s0'
* 'ip a add 192.168.1.101 dev wlp8s0'


### ip link

* 'ip link'
* 'ip l set dev wlp8s0 [down|up]'
* 'ip l set dev wlp8s0 address 00:00:00:00:00:00'


### ip neighbor

* 'ip neighbour'
* 'ip n'
* 'ip n show dev wlp8s0'


### ip route

* 'ip route'
* 'ip r'
* 'ip r add default via 192.168.1.1 dev wlp80s0'
