# Computer Networking

By: Mackenzie Binns, Foster McLane & Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# What is a computer network?


## Internal, External, DMZ


### Internal

* Internal networks are not publicly routable
* They are for private systems in a given organization

Note:
* What are the private IP subnets?
	- 10.0.0.0/8
	- 172.16.0.0/12
	- 192.168.0.0/16


### External

* Public computers of the organization
	- Accessible from the general Internet
* Usually serves things such as web-apps
* Can communicate with internally via access controls in a firewall


### DMZ

* Demilitarized zones are typically for isolating services
* If DMZ services are compromised, they do not provide additional surface area for pivoting attacks

Note:
* What would you host in a DMZ?
	- Websites (not web-apps)
	- DNS
	- Firewall


![CIA Poster](http://imgs.xkcd.com/comics/cia.png)



# How are computers connected?


## Core Infrastructure

* Routers/gateways
* Firewalls
* Managed switches
* Intrusion Detection System
* Load balancer

Note:
* These provide and control access inside central network


## Peripheral Infrastructure

* Wireless access points
* Unmanaged switches

Note:
* These provide access to the central network



# Routers, Firewalls, and Switches (Oh my!)


## Routers

* The computer sends packets to the router (which might also be the gateway)
* The router sends the packets off to another router as necessary to eventually reach the target address to complete the request
* Internal requests would never reach a gateway unless the router is the gateway

Note:
* Think of routers like intermediate mail sorting facilities: they don't deliver the mail, but they sort it and send it off to the right general location


## Firewalls

* Filter packets based on rules
* Stateless firewalls make decisions based only on a set of rules
* Stateful firewalls remember current connections and make "smart" decisions
	- Decides whether to drop, reject or pass
	- Performs network address translation (NAT)


### Zones

* Areas of a network that are separated by firewalls
* Examples include internal, external, DMZ


## Switches


### Unmanaged Switches

* Unintelligently route traffic using a stateless ARP table
* Statelessness of the ARP table allows ARP cache poisoning to occur
* Anyone on an unmanaged switch can see and control traffic of neighbors

Note:
* ARP poisoning is when the table is filled up with bogus entries by an attacker connected to the switch
* It can allow people to manipulate the traffic so they can sniff and potentially modify it


### Managed Switches

* Ports are individually configured with sets of rules
* Ports can be grouped into segments that cannot interact
* Managed switches can signal to routers the virtual network to which packets belong

Note:
* Manage switches port rules can range from IP's to MAC addresses
* Virtual network numbers are called VLANs



# Network Security


## Network Access Control

* Mainly enforced by the firewall
* Can also be enforced by managed switches
* The principle of least privilege states to allow as few things as necessary for the network to operate

Note:
* This is essential for effectively reducing surface area and pivot potential


## Trusted Neighbors

* Only put trusted neighbors on the same switch
* In CISCO Networks trusted neighbors are neighbor routers that the router will accept updates from (IGRP & EIGRP)

Note:
* Interior Gateway Routing Protocol
* Enhanced Interior Gateway Routing Protocol



# Core Network Services


## DHCP

* Tells the client how to connect to the network
* Includes routing, DNS, and IP information
* For dynamic connections to the network

Note:
* Core infrastructure generally uses static information instead of the dynamic information from DHCP


## Domain Name System (DNS)

* Translates names to IP addresses
* Essentially a phone book for the Internet

Note:
* DNS also store extra data about a domain such as the owner, mail server, and trusted addresses


## RADIUS

* Authenticates users connecting to a network with organization credentials
* Allows correlation between user and activity


## Address Resolution Protocol (ARP)

* Basic routing protocol for translating IP addresses in packets (from router) to MAC address targets (on switches)
* The translation table from layer 3 addressing to layer 2 addressing


## Active Directory (AD)

* For Windows computers to communicate authentication, administration, and sharing tasks
* User authentication from AD is called LDAP and is used on a variety of systems other than Windows for authentication



# Tools


## nmap - Network Map

* `nmap 192.168.1.101` - basic scan
* `nmap scanme.nmap.org`
* `nmap -p 22 192.168.1.101` - specific port scan
* `nmap -sT 192.168.1.101` - TCP connect scan
* `nmap -sU 192.168.1.101` - UDP scan
* `nmap -sV 192.168.1.101` - version detection
* `nmap -A 192.168.1.101` - enable OS and version detection, script scanning, and traceroute


## ncat - Network Cat

* `ncat 192.168.1.101 80` - open client socket to port 80
* `ncat -l 8080` - open server socket on port 80
* `ncat -l 8080 >file` - redirect data sent to server to file
* `ncat 192.168.1.101 8080 <file` - redirect file into connection to server


## Wireshark

* Useful to analyze network traffic
* Splits up network protocol and framing
* Useful to keep a log of all packets going across a network

Note:
* An essential tool for capturing and filtering data on a network



# Questions?
