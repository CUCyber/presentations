# Firewalls Part 1

By: Mackenzie Binns, Foster McLane & Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# What is a firewall really?


## Firewalls: Stateful, Stateless


### Firewalls

* Firewalls are designed to prohibit unauthorized access to a network
* Firewalls control access to the network by directing traffic based on rules
* Can be hardware *or* software based


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



# Config


## Rules 


### Basics

* source: where is the traffic came from
* destination: where the traffic came from
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


## Zones


### Why Zones

* Different requirements for different parts of the network
* Businesses are typically too large for simple rule based policies
* More granular control over traffic flow


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


## Signatures


### Signature Based Rules

* Signature based rule detection will look for traffic that is known
    - example: User-Agent: SQLMap
    - policy: drop connection
* This is a powerful tool when used in conjunction with others
* Makes the attacker work harder to even get a connection established
* Will hash files that run through and drop known malware



# Common Firewalls


## Debian

* iptables
    - uses chain rules
* Uncomplicated Firewall (UFW)
    - uses simplified chain rules


### Examples

```bash 
ufw enable 
ufw allow 80,22,443
ufw allow 80,443/tcp
ufw deny 80/tcp
ufw status
ufw app INFO <profile>
```

Note:
* Has the ability to create application profiles


## RedHat/Fedora

* iptables
* firewalld
    - uses zones and services rather than chain rules


### Examples
```bash
# enable and start firewalld
systemctl enable --now firewalld

firewalld-cmd --status
firewalld-cmd --zone=public --add-port=80/tcp # --permanent
firewalld-cmd --zone=public --remove-port=80/tcp 
firewalld-cmd --zone=public --add-service=http
firewalld-cmd --get-services
```

Note:
* Zones: home, trusted, public
    - You can make your own.


## Hardware

* Cisco
* Palo Alto
* Have terminal interface
* Most have gui interfaces
* Gui interfaces are slower and may not lend themselves to more advanced configurations


## Other

* Endian
* pfSense
* many more



# Bypassing


## Go Around

* Bypass the firewall altogether by finding an entry point that does not route through the firewall
* Example: Send a phishing email into the network and create a backdoor on a users computer.


## Custom Packets

* Craft a packet that does not trigger rules 
* Hard to do based on the layers of rules typically involved


## Avoiding Signatures

* Create your own malware!


## Abuse Stupid Rules

* Example: port 22 is forwarded to an internal computer
* Craft your attack for the machine on the receiving end



# Questions?
