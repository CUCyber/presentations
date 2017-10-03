# Computer Networking

By: Mackenzie Binns, Foster McLane & Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# What is a computer network?


## Internal, External, DMZ


### Internal

* internal networks are not publicly routable
* they are for private systems in a given organization

Note:
* ask someone if they know the private IP subnets


### External

* public computers of the organization
	- accessible from the general Internet
* usually serves things such as web-apps 
* can communicate with internally via access controls in a firewall


### DMZ

* Demilitarized zones are typically for isolating services.
* If DMZ services are compromised, they do not provide additional surface area for pivoting attacks.

Note:
* What would you host in a DMZ?
	- websites (not web-apps)
	- DNS
	- firewall


![CIA Poster](http://imgs.xkcd.com/comics/cia.png)



# How are computers connected?


## Core Infrastructure

* routers/gateways
* firewalls
* managed switches
* intrusion detection system
* load balancer


## Peripheral Infrastructure

* wireless access points
* unmanaged switches



# Routers, Firewalls, and Switches (Oh my!)


## Routers

* The computer sends packets to the router (which might also be the gateway).
* The router sends the packets off to another router as necessary to eventually reach the target address to complete the request.
* Internal requests would never reach a gateway unless the router is the gateway.

Note:
* Talk about ARP


## Firewalls

* filter packets based on rules
* stateless firewalls make decisions based only on a set of rules 
* stateful firewalls remember current connections and make "smart" decisions
	- decides whether to drop, reject or pass 
	- performs network address translation (NAT)


### Zones

* areas of a network that are separated by firewalls
* examples include internal, external, DMZ


## Switches


### Unmanaged Switches

* unintelligently route traffic using a stateless ARP table
* statelessness of the ARP table allows ARP cache poisoning to occur
* anyone on an unmanaged switch can see and control traffic of neighbors


### Managed Switches

* ports are individually configured with sets of rules
* ports can be grouped into segments that cannot interact
* managed switches can signal to routers the virtual network to which packets belong

Note:
* Manage switches port rules can range from IP's to MAC addresses



# Network Security


## Network Access Control

* mainly enforced by the firewall
* also can be enforced by managed switches
* a general rule is to allow as few things as necessary for the network to operate


## Trusted Neighbors

* Only put trusted neighbors on the same switch.
* In CISCO Networks trusted neighboors are neighboor routers that the router will accept updates from (IGRP & EIGRP).

Note:
* Interior Gateway Routing Protocol
* Enhanced Interior Gateway Routing Protocol



# Core Network Services


## DHCP

* tells the client how to connect to the network
* includes routing, DNS, and IP information


## Domain Name System (DNS)

* translates names to IP addresses
* essentially a phone book for the Internet


## RADIUS

* authenticates users connecting to a network with organization credentials


## Address Resolution Protocol (ARP)

* basic routing protocol for translating IP addresses in packets (from router) to MAC address targets (on switches)


## Active Directory (AD)

* for Windows computers to communicate authentication, administration, and sharing tasks



# Tools


## nmap - Network Map

* 'nmap 192.168.1.101'
* 'nmap scanme.nmap.org'
* 'nmap -p 22 192.168.1.101'
* 'nmap -sT 192.168.1.101'
* 'nmap -sU 192.168.1.101'
* 'nmap -sV 192.168.1.101'
* 'nmap -A 192.168.1.101'


## ncat - Network Cat

* 'ncat 192.168.1.101 80'
* 'ncat -l 8080'
* 'ncat -l 8080 >file'
* 'ncat 192.168.1.101 8080 <file'


## Wireshark

* useful to analyze network traffic
* splits up network protocol and framing
* useful to keep a log of all packets going across a network



# Questions?
