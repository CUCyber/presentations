# Pi-hole
### Network wide ad blocking

By: Kyle Wolfe and Andrew Samuels

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is Pi-Hole?


## Pi-Hole
"A black hole for internet advertisements"

[Pi-hole](https://pi-hole.net/) is a DNS server that blocks advertisments for all devices that
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
![gravity](gravity.png)



# Installation


## Choose Interface
![interface](interface.png)
Note: We recommend ethernet unless you really can't get a cord to your device.


## Select Upstream DNS
![dns](dns.png)
Note: This is the DNS provider that the pi-hole will forward to when requesting
an unkown non-advertisment domain. If you are unsure, pick Google.


## Select Protocols
![protocol](protocol.png)
Note: Leave both IPv4 and IPv6 selected.


## Static IP
![static](static.png)
Note: Confirm that the listed static IP and gateway are correct for your host device and network.


## Web interface
![webinterface](webinterface.png)
Note: If you want to check on your pi-hole, we recommend enabling the web
interface. If you are a "set it and forget it" person, feel free to disable this.


## Query Logging
![logging](logging.png)
Note: We recommend to keep this on so you can easily see what's going on in your
network.


#### Complete!
![complete](complete.png)

Save the displayed password so you can login to the web interface. If you
forget it, you can reset it through the CLI with:
```Bash
sudo pihole -a -p
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
