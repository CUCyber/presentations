# Pi-hole
### Network wide ad blocking

By: Kyle Wolfe and Andrew Samuels

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is Pi-Hole?


## Pi-Hole
"A black hole for internet advertisements"

Pi-hole is a DNS server that blocks advertisments for all devices that
route through the server.


## Why?
* Ads suck!
* Ads can be malware vectors
* Sites can overuse ads
* Save mobile data when combined with a VPN


### Why - unconventional uses
* Simple way to monitor network activity
* Restrict access to specific sites


## Hardware
* [Raspberry Pi](https://www.raspberrypi.org/)
* [Digital Ocean](https://digitalocean.com)
* Virutal Machine
* Containers
* Or directly on your own machine!



# How does it work?


## dnsmasq

"A lightweight DHCP and caching DNS server."

At it's core, pi-hole is a wrapper for dnsmasq that provides list updating
and GUI management.


## Whitelists and Blacklists

* **Whitelists**: Allow network traffic only from the specified domains
* **Blacklists**: Deny all traffic from the specified domains


### Pi-hole lists
Pi-hole uses a blacklist of known ad-serving domains.

When a request from a blacklisted domain is made, it is forwarded to the
host and then nothing loads!


#### gravity.list
${image of `/etc/pihole/gravity.list`}



# Installation
${add image of each step}


## Choose Interface
Note: We recommend ethernet unless you really can't get a cord to your device.


## Select Upstream DNS

Note: This is the DNS provider that the pi-hole will forward to when requesting
an unkown non-advertisment domain. We recommend ${ask fooster for opinion, but probably 8.8.8.8}


## Select Protocols

Note: Leave both IPv4 and IPv6 selected.


## Static IP

Note: Confirm that the listed static IP and gateway are correct for your network.


## Web interface

Note: If you want to check on your pi-hole, we recommend enabling the web
interface. If you are a "set it and forget it" person, feel free to disable this.


## Query Logging

Note: We recommend to keep this on so you can easily see what's going on in your
network.


## Complete!

Save the displayed password so you can login to the web interface. If you
forget it, you can reset it through the CLI with:
```Bash
pihole -a -p
```



# Web interface


#### Dashboard
![dashboard](dashboard.png)
Note: This page gives you a brief overview of your network in the last 24
hours.


## Query Log
![logs](logs.png)
Note: Here you can monitor the DNS queries in real time.



# OpenVPN

TBD
