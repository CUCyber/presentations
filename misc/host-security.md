# Host-Based Security

By: Weston Belk

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# Philosophy


## Philosophy

* Minimize services
* Strict access controls
* Good logging
* Up-to-date software
* Data security
* Backups



# Minimizing Services


## Minimizing Services

* Only install what you need
* Start from a well-reviewed base image
* Know what processes are running
* Know which services are listening


### Deploying a Base Image

Having a pre-hardened base image specific to your environment is pretty great.

How can we do this at scale though?


### Provisioners!

Automates:
* Software provisioning
* Configuration management
* Application deployment

Examples:
* Puppet
* Ansible


### Running Processes and Listening Services

Reports a snapshot of the current processes.
```bash
	$ ps aux
```

A tool used to dump socket statistics.
```bash
	$ ss -tulpn
```

Note:
Walk through man pages



# Strict Access Controls


## Strict Access Controls

* Good corporate policies
* Key-based authentication
* Passwords
* File permissions
* Encryption
* Firewalls
* Isolation


### Business Strategies

* Don't let the intern burn down prod
* Don't let *anybody* burn down prod
* Minimize people able to login to the machine
* Record what they're doing


### Physical Security

* Lock your doors
* Lock your bezels
* Don't leave hardware laying around
* Destroy harddrives after use

Note:
Mention the physical security presentation and show a picture of bezels that lock


### Key-based Authentication

* Use key-based authentication where possible
* Improbable to be brute-forced
* Harder to social-engineer

https://www.digicert.com/TimeTravel/Vertical-Universe.jpg

Note:
Knowing my pet's name doesn't help you guess my private key


### Passwords

* Use **good** passwords where key-based authentication is not possible
* Protect your bios with a password


### File Permissions


### Encryption


### Firewalls

* Enable your machine's firewall!
* Only let very select traffic in
* Put heavy restrictions on outgoing traffic if possible

Note:
Strict outgoing filewall rules can protect your data and can help make privilege escalation way more difficult after RCE has been achieved


### Isolation

* Isolate services to jails/containers or their own box
* Isolate boxes to their own network when possible
* Only let computers talk to each other if necessary
* Implement in hardware when practical



# Logging


## Logging

* Turn it on
* Don't turn it off
* Turn it up or down
* Organize your logs
* Track changes


### Make sure you're logging

Some services don't enable much or any logging at all.

Turn up your logging to an appropriate amount.

Access logs are usually very important

Note: Access logs for databases


### syslogs

The place where your logs go!

* Centralized location for logs from the kernel, system utilities, and services
* Easy to organize, filter, view, and send logs elsewhere

Common Implementations

* rsyslogd
* journalctl

Note:
journalctl is a part of systemd


### ELK Stack

* Elasticsearch, Logstash, and Kibana
* Logstash: ingests data and transforms it. --> Sends to elasticsearch
* Elasticsearch: Enables you to effectively and efficiently search logs
* Kibana: Lets you better visualize the data


### Intrusion Detection Systems



# Up-to-date Software


## Keep Software Updated

* Install security and application updates
* Choose something stable


### Install Security Updates

* apt update
* yum update
* etc


### Choose Something Stable

* Choose a stable operating system
* Something designed for server use like Debian, Ubuntu LTS Server, or CentOS
* Don't run Arch (btw) on your servers
* Major security updates are often backported to stable releases



# Data Security


## Encryption

* 