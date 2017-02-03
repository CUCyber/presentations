# Firewalls - Part 1

By: Mackenzie Binns, Foster McLane & Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is a firewall really?


## Firewalls: Stateful, Stateless


### Firewalls

* firewalls are designed to prohibit unauthorized access to a network
* firewalls control access to the network by directing traffic based on rules
* can be hardware *or* software based


### Stateful

* firewalls have memory to store traffic information
    - traffic is looked at in context
    - this is called stateful packet inspection (SPI)
* only packets of a known connection are allowed to pass the firewall
* firewalls also implement rules on the traffic during SPI

Note:
* can tell what stage of a TCP connection the communication is in
* can tell if the MTU has changed
* can tell if the packet has fragmented


### Stateless

* do not store traffic information
* each packet is treated as a new connection
* based on rules
    - these are sometimes referred to as access control lists (ACLs)

Note:
 * does not know if a packet is pretending to be something you requested



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

* different requirements for different parts of the network
* businesses are typically too large for simple rule based policies
* more granular control over traffic flow


### Internal

* internal network usually are more dynamic than external networks
* typically require dynamic routing

Note:
* What would you put in the internal network?
    - databases
    - another firewall
    - things that do not need to be public


### External

* typically have static routing
* more stringent rule policies

Note:
* Why would rules be more strict in the external zone?


### Guest 

* rules configure for computers that are guests on the network


### DMZ

* does not have a way into the internal network
* has the most strict rules (typically no traffic can leave unless specifically allowed)

Note:
* What are things you would put in a DMZ?
    - DNS
    - static websites
    - etc.


## Signatures


### Signature Based Rules

* signature based rule detection will look for traffic that is known
    - example: User-Agent: SQLMap
    - policy: drop connection
* this is a powerful tool when used in conjunction with others
* makes the attacker work harder to even get a connection established
* will hash files that run through and drop known malware



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
* has the ability to create application profiles


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
* have terminal interface
* most have gui interfaces
* gui interfaces are slower and may not lend themselves to more advanced configurations


## Other

* Endian
* pfSense
* many more



# Bypassing


## Go Around

* bypass the firewall altogether by finding an entry point that does not route through the firewall
* example: Send a phishing email into the network and create a backdoor on a users computer.


## Custom Packets

* craft a packet that does not trigger rules 
* hard to do based on the layers of rules typically involved


## Avoiding Signatures

* Create your own malware!


## Abuse Stupid Rules

* example: port 22 is forwarded to an internal computer
* craft your attack for the machine on the receiving end



# Questions?
