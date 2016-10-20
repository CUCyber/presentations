# How Secure Is A Network:
## Introduction to Ettercap

By: Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is Ettercap?


## What is Ettercap?

* a suite of utilities for the purposes of networking sniffing
* useful to show what data your network traffics
* useful to find sensitive information on a network
* useful to show how the traditional stateless ARP scheme can be used for leverage

Note:
Ettercap has very strong Red and very strong Blue reasons for existing. We will be using it in a Red fashion to demonstrate that not everything that looks secure is secure.


## What can Ettercap do?

* poison the ARP cache
* ICMP gateway redirect
* port stealing
* forge DHCP responses
* DNS spoofing
* TLS stripping

Note:
We are going to demonstrate ARP cache poisoning, DNS spoofing, and TLS stripping.


## How do I install it?

* `ettercap` package in most distros (`ettercap-gtk` in Arch and `ettercap-graphical` in Ubuntu)
* https://ettercap.github.io/ettercap/

```sh
$ ettercap -G
```



# ARP Cache Poisoning


## What is the ARP Cache?

* cache of layer 3 <-> layer 2 address translation
* stateless per the standard

Note:
It is the cache that nodes and switches on a network keep.


## What does poisoning it mean?

* utilizes the stateless nature of the protocol
* fill the table with entries you provide
* allows you to basically control where most if not all of the traffic goes

Note:
You send ARP replies and by the stateless nature of the protocol, they get added to the table regardless of whether there was a request. You want to make it so that your MAC address is the gateway, then you're the target of internet traffic where you can proxy and MITM it.


## Let's poison a network!

Note:
It works on switches and WiFi!



# DNS Spoofing


## What is DNS?

* system for getting information about hostnames (i.e. 'kernel.org'), most commonly their addresses (i.e. '149.20.4.69')
* DNS can be spoofed to redirect a user to a website they did not intend (and could be one you control)
* useful when you want to use basic methods to spoof the site someone thinks they are on


## Let's spoof the DNS!



# TLS Stripping


## What is TLS?

* system for encrypting layer 4 protocols
* trust is hierarchical from root authorities down
* only as secure as the intermediate authorities


## What does TLS stripping mean?

* in between the client and server
* you present your own certificate to the client
* connect to the server yourself and proxy the (unencrypted!) data


## Let's perform a TLS stripping attack!



# Questions?
