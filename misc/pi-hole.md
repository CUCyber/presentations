# Pi-hole
### Network wide ad blocking

By: Kyle Wolfe and Andrew Samuels

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## What is Pi-Hole?


## Pi-Hole

"A black hole for internet advertisements"

[Pi-hole](https://pi-hole.net/) is a DNS server that blocks advertisments for all devices that
route through the server.


## Why?

* Ads suck!
* Ads can be malware vectors.
* Sites can overuse ads.


### Why - unconventional uses

* Simple way to monitor network activity.
* Restrict access to specific sites.
* Save mobile data when combined with a VPN.


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

* **Whitelists**: Allow network traffic only from the specified domains.
* **Blacklists**: Deny all traffic from the specified domains.


### Pi-hole lists

Pi-hole uses a blacklist of known ad-serving domains.

When a request from a blacklisted domain is made, it is forwarded to the
host and then nothing loads!


#### gravity.list

![gravity](gravity.png)



# Installation


## Install

```bash
curl -sSL https://install.pi-hole.net | bash
```

Note:
Be careful when piping into bash, it is a huge security risk.


### Choose Interface

![interface](interface.png)

Note:
We recommend ethernet unless you really can't get a cord to your device.


### Select Upstream DNS

![DNS](dns.png)

Note:
This is the DNS provider that the pi-hole will forward to when requesting
an unknown non-advertisement domain. If you are unsure, pick Google.


### Select Protocols

![protocol](protocol.png)

Note:
Leave both IPv4 and IPv6 selected.


### Static IP

![static](static.png)

Note:
Confirm that the listed static IP and gateway are correct for your host device and network.
This will have to be set before starting the installation of the pi-hole, typically in your router/modem settings.


### Web interface

![webinterface](webinterface.png)

Note:
If you want to check on your pi-hole, we recommend enabling the web
interface. If you are a "set it and forget it" person, feel free to disable this.


### Query Logging

![logging](logging.png)

Note:
We recommend to keep this on so you can easily see what's going on in your
network.


### Complete!

![complete](complete.png)

Note:
Save the displayed password so you can login to the web interface. If you
forget it, you can reset it through the CLI with: `sudo pihole -a -p`



# Web interface


#### Dashboard

![dashboard](dashboard.png)
Note:
This page gives you a brief overview of your network in the last 24
hours.


## Query Log

![logs](logs.png)
Note:
Here you can monitor the DNS queries in real time.



# Monitor your Network


## Disclamer

This is not a full blown IDS so you will NOT notice all intrusions.


## What can you expect to find

* rogue devices
* smart TV spying
* infections
* porn


## Rogue Devices

Devices you do not know about will show up in the logs.


## Smart TV Spying

Visio smart TVs send information back to Visio to determine what you are watching.

Samsung also phones home.

Note:
https://www.reddit.com/r/pihole/comments/4y8w8w/block\_spying\_smart\_tvs/?st=j7s0hdpb&sh=09385a40


## Infection

Notice a device calling home to its new master.


## Porn

You will have a log of all requests to the DNS server,
so effectively you have a log of what websites people on your network visit. 



# Questions?
