---
---

# Bettercap

By: Nick Bulischeck and Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# What is Bettercap?


## What is Bettercap?

Bettercap is a powerful, flexible and portable tool

* Perform various types of MITM attacks against a network

* Manipulate HTTP, HTTPS and TCP traffic in realtime

* Sniff for credentials and much more


## Man-In-The-Middle

* Someone is between you and the resources you're requesting

* They can see your traffic


## Man-In-The-Middle

![img](mitm.jpg)


## Starbucks Example

Note:
The router/switch is responsible for forwarding all of your packets to the correct destination.


## Why not Ettercap?

* Unstable on large networks (host discovery)

* Not easily extended unless you dev in C/C++

* Filters are outdated and don't always work

* No modular HTTP(S) and TCP transparent proxies

* No credential sniffer


## Dependencies

* Comes as a Ruby gem

* Ruby (>= 1.9)

* RubyGems environment

* Fully compatible with GNU/Linux, Mac OS X and OpenBSD platforms.


## Installation

Ubuntu

```bash
sudo apt install build-essential ruby-dev libpcap-dev
gem install bettercap
```

Kali

```bash
sudo apt update
sudo apt install bettercap
```

BlackArch

```bash
sudo pacman -S bettercap
```


## Installation

Source

```bash
git clone https://github.com/evilsocket/bettercap
cd bettercap
bundle install
gem build bettercap.gemspec
sudo gem install bettercap*.gem
```



## Usage

```bash
Usage: bettercap [options]
```


### Generic Usage


#### Specific Targets by IP Addr

```bash
sudo bettercap -T 192.168.1.10, 192.168.1.11
```


#### Specific Targets by MAC Addr

```bash
sudo bettercap -T 01:23:45:67:89:10
```


#### Range of Targets

```bash
sudo bettercap -T 192.168.1.1-30
```


#### Attacking a Subnet

```bash
sudo bettercap -T 192.168.1.1/24
```


#### Randomize YOUR MAC

```bash
sudo bettercap --random-mac
```

Note:
We talked about the option of MAC changing last presentation


### Options

```bash
-I, --interface IFACE  | Specify your interface
-T, --target ADDRESS   | Specify the target address
-G, --gateway ADDRESS  | Specify the gateway address
-X                     | Enable sniffing
--use-mac ADDRESS      | Specify your MAC address
--ignore ADDRESS       | Specify the address to ignore
-h                     | Help
```

Note:
Bettercap automatically detects your default network interface, but it can use another interface if it's specified.


### Fun Options

```bash
sudo bettercap -T 192.168.1.2 --kill
sudo bettercap --ignore [your ip] --kill
sudo bettercap --proxy -P POST
```


For examples & docs please visit https://bettercap.org/



# Demo



# Questions?



# Competitions
