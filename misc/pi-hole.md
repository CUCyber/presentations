# Pi-hole
## Network wide ad blocking

By: Kyle Wolfe and Andrew Samuels

CU Cyber

## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!


# What is Pi-Hole?

## What is Pi-Hole?
"A black hole for internet advertisements"
Pi-hole is a DNS server that blocks advertisments for all devices that
route through the server.

## Why?
* Ads suck
* Ads can be malware vectors
* Sites can overuse ads
* Save mobile data when combined with a VPN

## Hardware
* [Raspberry Pi](https://www.raspberrypi.org/)
* [Digital Ocean](https://digitalocean.com)
* Virutal Machine
* Containers
* Or directly on your own machine!
${image of raspberry pi here}


# How does it work?

## dnsmasq

"A lightweight DHCP and caching DNS server."
At it's core, pi-hole is a wrapper for dnsmasq that provides list updating
and GUI management.

## Whitelists and Blacklists

* Whitelists: Allow network traffic only from the listed domains
* Blacklists: deny all traffic from the listed domains

Pi-hole uses a blacklist of known ad-serving domains.
When a request from a blacklisted domain is made, it is forwarded to the
host and then nothing loads!
${image of `/etc/pihole/gravity.list`}


# Installation
${add image of each step}

## Choose Interface
We recommend ethernet unless you really can't get a cord to your device.

## Select Upstream DNS

This is the DNS provider that the pi-hole will forward to when requesting
an unkown non-advertisment domain.

We recommend ${ask fooster for opinion}

## Select Protocols

Leave both IPv4 and IPv6 selected.

## Static IP

Confirm that the listed static IP and gateway are correct for your network.

## Web interface

If you want to check on your pi-hole, we recommend enabling the web
interface.
If you are a "set it and forget it", feel free to disable this.

## Query Logging

We recommend to keep this on so you can see what's going on in your
network.

## Complete!

Save the displayed password so you can login to the web interface. If you
forget it, you can reset it through the CLI with `pihole -a -p`



# Web interface
${Insert relevant images}

## Dashboard

## Query Log
live demo?



# OpenVPN
TBD if necessary
