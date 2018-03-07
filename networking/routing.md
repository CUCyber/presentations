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
    - Traffic is looked at in context
    - This is called stateful packet inspection (SPI)
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
    - These are sometimes referred to as access control lists (ACLs)

Note:
 * Does not know if a packet is pretending to be something you requested


## Zones


### Why Zones

* Different requirements for different parts of the network
* Businesses are typically too large for simple rule based policies
* More granular control over traffic flow


## Rules 


### Basics

* Source: where the traffic came from
* Destination: where the traffic is going
* Service: the service that the traffic is for
* Interface: interface the traffic is expected from
* Direction: going in or coming out
* Action: allow, deny, drop, reject

Note:
* Source: You can specify computers that traffic is allowed to come from.
* Destination: You can specify where traffic is going.
* Service: You can specify what service is allowed to connect to this.
* Interface: You only want traffic that is coming in on Ethernet.
* Direction: You can only SSH out of the network no incoming connections are allowed.
* Action: You can drop or allow connections matching the above rules.



# Routing


## Subnets

* A subnet is a sequence of IP addresses aligned to a bitmask
* Basically a range of IP addresses that start on a power of two and are as long as a power of two
	- An example is starting on 10.0.0.0 and ending on 10.0.0.15


### CIDR Notation

* Subnets are noted in CIDR notation:
	- `<base address>/<bitmask>`
	- Example: 10.0.0.0/28 (10.0.0.0 - 10.0.0.15)
* Base address is the starting address
* Bitmask is a number identifying the free binary digits in the address
* Basically do 2^(32 - bitmask) to get the number of addresses in the subnet


## Interfaces

* Physical or virtual port on the firewall
* Segregates parts of the network and requires rules between them
* Has an address and a subnet
	- Usually combined into one format: `<address>/<bitmask>`
	- Example: 10.0.0.3/28


## Metrics

* Distance between routes
* Used to prioritize a valid route over another


## Gateway

* Endpoint to a higher network (e.g. the internet)
* Usually a catch-all route (0.0.0.0/0)
* Usually has the highest metric

Note:
It has the highest metric so that it is not chosen for internal packets


## Routing Tables

* Each item in the table is chosen in order of lowest metric first
* A packet matches if that packet's destination matches the route's subnet (e.g. 10.0.0.0/28)
* A packet goes out on the interface for the route that gets picked
* The first route that matches gets picked


### Example

```
10.0.0.0/24 dev eth0 metric 0
10.0.1.0/24 dev eth1 metric 0
0.0.0.0/0 dev eth3 metric 10
```



# Network Address Translation (NAT)


## Source Translation

* Changes the source address of a packet
* Can make a packet from 10.0.0.3 appear as though it is coming from 10.0.0.5
* Simple rewrite after routing


## Destination Translation

* Changes the destination address of a packet
* Can make a packet going to 10.0.0.3 instead go to 10.0.0.5
* Simple rewrite before routing


## NAPT

* Network Address and Port Translation
* A type of translation where multiple addresses are multiplexed behind a single address
* Can make a packet from 10.0.0.4 go to 130.127.255.250 and back without 130.127.255.250 knowing the actual source address


* Does source translation so that source address is that of the router
* Adds routes based on addresses and ports of connection to allow those packets to get back to the original host



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

* Separation requires packets between them to go through firewall
* Generally physically separated onto different ports on the firewall



# Virtual LAN (VLAN)


## Tagging

* Packets in a virtual LAN are tagged at layer 2 between the hosts
* Allows supportive hardware to use this extra information to route and rule packets
* Security relies on trusting the lines which are tagged


## Configuring

* Generally configured in the switch and firewall
* Hosts can configure VLANs too, for example if they are hosting VMs
* Assign tags to interfaces (physical or virtual) and add routing and rules between them in the switch or firewall



# Rules


## Why Rules?

Rules are the fundamental access control mechanism in a firewall. They decide what happens to the traffic.


## Examples


```
allow from external to 10.0.0.4 proto tcp port 22

allow from 10.0.1.0/24 to 10.0.0.5 proto tcp port 3306

allow from internal to external proto tcp port 80
allow from internal to external proto tcp port 443
allow from internal to external proto tcp port 587
```



# Deep Packet Inspection (DPI)


## DPI

* In DPI routers look at the whole packet instead of just the relevant layer 3 header
* Many commercial firewall solutions, e.g. Palo Alto, have this feature


## Monitoring

* Use in monitoring to understand trends between what the packets are doing
* Examples are getting fields from HTTP headers or reporting versions used in TLS handshakes


## Intrusion Detection (IDS)

* Use in intrusion detection by either detecting signatures or anomalies
* Packet capture or metadata kept can be used later for manually finding an intrusion


## Malware Detection

* Use in malware detection via known malware signatures or methods of delivery


## App-ID

* Use in creating rules based on the detected application
* E.g. allow actual MySQL data on a port instead of TLS data



# Virtual Private Network (VPN)


## Site-To-Site

* Connects two disjoint networks via a gateway
* Usually configured in the routers allowing it to send packets between the networks transparently
* Layer 2 or layer 3


## Remote Access

* Connecting to a remote network and accessing the hosts
* Layer 2 or layer 3



# Questions?
