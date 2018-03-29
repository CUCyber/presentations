# Containers and the Cloud 

By: Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## Containers


### What is a Container?

* Abstraction at the application layer
* Multiple containers can run on the same machine and share the kernel
* Isolated processes in user space


### How is it different from a VM?

* VMs abstract physical hardware
* Containers take up far less space
* Containers can start nearly instantly


![container](container.png)


![vm](vm.png) 


### What types of containers are there?

* Docker
* LXC
* FreeBSD Jails



## Docker

* Open platform for developing, shipping, and running applications
* Primarily developed for Linux
* High-level API to provide lightweight containers that run processes in isolation


### Docker Architecture

![architecture](architecture.svg)


### Docker-compose

![docker-compose](docker-compose.png)

* Used to run multi-container Docker applications
* Uses YAML files for configuration
* Bring entire projects up/down simultaneously


### Short Demo

```Bash
git clone https://github.com/nbulischeck/dctf.git
cd dctf
sudo python ctf.py -bus
```



## AWS Stuff


