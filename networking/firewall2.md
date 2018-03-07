# Firewalls Part 2

By: Kyle Wolfe & Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# Recap


## Firewalls: Stateful, Stateless


### Stateful

* Firewalls have memory to store traffic information
    - traffic is looked at in context
    - this is called stateful packet inspection (SPI)
* Only packets of a known connection are allowed to pass the firewall
* Firewalls also implement rules on the traffic during SPI

Note:
* Can tell what stage of a TCP connection the communication is in
* Can tell if the MTU has changed
* Can tell if the packet has fragmented


### Stateless

* Do not store traffic information
* Each packet is treated as a new connection
* Based on rules
    - these are sometimes referred to as access control lists (ACLs)

Note:
 * Does not know if a packet is pretending to be something you requested


## Zones


### Why Zones

* Different requirements for different parts of the network
* Businesses are typically too large for simple rule based policies
* More granular control over traffic flow


## Rules 


### Basics

* source: where the traffic came from
* destination: where the traffic is going
* service: the service that the traffic is for
* interface: interface the traffic is expected from
* direction: going in or coming out
* action: allow, deny, drop, reject

Note:
* source: You can specify computers that traffic is allowed to come from.
* destination: You can specify where traffic is going.
* service: You can specify what service is allowed to connect to this.
* interface: You only want traffic that is coming in on Ethernet.
* direction: You can only SSH out of the network no incoming connections are allowed.
* action: You can drop or allow connections matching the above rules.



# Routing


## Subnets


## Interfaces


## Metrics


## Gateway



# Network Address Translation (NAT)


## Source Translation


## Destination Translation


## Both


## Network Address and Port Translation (NAPT)



# Zones


## Typical Zones


### Internal

* Internal network usually are more dynamic than external networks
* Typically require dynamic routing

Note:
* What would you put in the internal network?
    - databases
    - another firewall
    - things that do not need to be public


### External

* Typically have static routing
* More stringent rule policies

Note:
* Why would rules be more strict in the external zone?


### Guest 

* Rules configure for computers that are guests on the network


### DMZ

* Does not have a way into the internal network
* Has the most strict rules (typically no traffic can leave unless specifically allowed)

Note:
* What are things you would put in a DMZ?
    - DNS
    - static websites
    - etc.


## Separation



# Virtual LAN (VLAN)


## Tagging


## Configuring



# Rules


## Why Rules?

Rules are the fundamental access control mechanism in a firewall. They decide what happens to the traffic.


## Examples



# Deep Packet Inspection (DPI)


## Monitoring


## Intrusion Detection (IDS)


## Malware Detection


## App-ID



# Virtual Private Network (VPN)


## Site-To-Site


## Remote Access



# Questions?
