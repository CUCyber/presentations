# Firewalls!

By: Mackenzie Binns, Foster McLane & Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is a firewall really?


## Firewalls, Stateful, Stateless


### Firewall

* Firewalls are designed to prohibit unauthorized access to a network.
* Firewalls control access to the network by directing traffic based on rules
* Can be hardware OR software based


### Stateful

* Stateful firewalls have a memory for traffic
    - Traffic is looked at in context
    - This is called Stateful Packet Inspection (SPI)
* Only packets of a known connection are allowed to pass the firewall
* They also implement rules on the traffic during SPI

Note:
* The can tell what stage of a TCP connection the communication is in
* Can also tell if the MTU has changed
* Can also tell if the packet has fragmented


### Stateless

* Do not have a memory
* Each packet is treated as a new connection
* Also based on rules
    - These are sometimes referred to as ACL's

Note:
 * Does not know if a packet is pretending to be something you requested



# Config


## Rules 


### Basics
* Source: Where is the traffic coming from
* Destination: Where is the traffic going
* Service: What is the service that the traffic is for
* Interface: What interface is the traffic expected from
* Direction: Going in, or coming out
* Action: Allow, Deny, Drop, Reject

Note:
* Source: You can specify computers that traffic is allowed to come from
* Destination: You can specify where traffic is going
* Service: What service is allowed to connect to this
* Interface: You only want traffic that is coming in on Ethernet
* Direction: You can only SSH out of the network no incoming connections are allowed
* Action: You can drop or allow connections matching the above rules


## Zones


### Why Zones

* Different requirements for different parts of the network
* Businesses are typically too large for simple rule based policies
* More granular control over traffic flow


### Internal

* Internal network usually are more dynamic than external networks
* Typically require dynamic routing

Note:
* What would you put in the internal network
    - Databases
    - Another Firewall
    - Things that don't need to be public


### External

* Typically have static routing
* More stringent rule policies

Note:
* Why would rules be more strict in the External Zone


### Guest 

* Rules configure for computers that are guests on the network


### DMZ

* Does not have a way into the internal network
* Has the most strict rules (Typically no traffic can leave unless specifically allowed)

Note:
* Things you would put in a DMZ
    - DNS
    - Static websites
    - ECT.


## Signatures


### Signature based rules

* Signature based rule detection will look for traffic that is known
    - Example: user-agent: SQLMap
    - Policy: Drop connection
* This is a powerful tool when used in conjunction with others
* Makes the attacker work harder to even get a connection established
* Also will hash files that run through and drop known malware



# Common Firewalls


## Debian

* IPTables
    - uses rules
* UFW
    - uses rules


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
* Also has the ability to create application profiles


## RedHat

* IPTables
* Firewalld
    - Uses zones and services rather than chainrules


### Examples
```bash
#This is how to turn firwalld on RIGHT now
systemctl enable --now firewalld

firewalld-cmd --status
firewalld-cmd --zone=public --add-port=80/tcp # --permanent
firewalld-cmd --zone=public --remove-port=80/tcp 
firewalld-cmd --zone=public --add-service=http
firewalld-cmd --get-services
```

Note:
* zones=home, trusted, public
    - you can make your own


## Hardware

* CISCO
* Palo Alto
* These can be accessed through terminal like interfaces
* Most have gui interfaces, but those are slower and may not lend themselves to more advanced configs


## Other

* Endian
* PFSense
* Many more



# Bypassing


## Go around

* Literally bypass the firewall altogether by finding an entry point that does not route through the firewall
* Example
    - Send a phishing email into the network and create a backdoor on a users computer


## Custom packets

* Craft a packet that doesn't trigger rules 
* This is hard to do based on the layers of rules typically involved


## Avoiding signatures

* Create your own malware!


## Abuse stupid rules

* If packets are being forwarded to another computer from port 22 on a firewall
* Craft your attack for the machine on the receiving end



# Questions!?
