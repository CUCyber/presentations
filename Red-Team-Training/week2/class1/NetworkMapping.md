# Network Mapping

By: Adam Van Scyoc

CU Cyber



## Hacking and the Network

Network mapping (nmap)
* Ports
* TCP v UDP
* Three way handshake
* Nmap practice
* Goal of Hacking - Exploit Vulnerable Processes

note: Hacking a system doesn't necessarily need to involve access over a network - 
though that is by far the most common scenario. It's possible to have "local code
execution" without having remote access. Example: sitting down to a terminal
and attempting to run malicious code locally to escalate priveledges.

These days, almost any system that a client would
pay to have evaluated is likely to have some form of network connectivity.

A computer that is isolated from the internet is said to be "air gapped" - 
a deliberate security measure. An example is the ECE 4490 Network Security lab in
basement of Riggs Hall.


### The Open Systems Interconnection (OSI) Model 

7. Application layer (HTTP)
6. Presentation layer
5. Session layer (Name pipes, SOCKS)
4. Transport layer (TCP, UDP)
3. Network layer (IP)
2. Data link layer (Ethernet, WiFi)
1. Physical layer

note: A computer network can be described in terms of the 7 layer OSI model. Each layer below is opaque to the layers above. 
The intracacies of computer networking will be left for CPSC 3600 Networking and Network Programming - and ECE 4380 Computer Communications.

Thinking of networking in the terms is important to us because we will be accessing most systems that we are attempting to penetrate over the network. Scanning and exploitation are both reliant on a network. 

We will be dealing mostly with layers 4 and 5.
What layer are 'ports' defined?



### TCP

Transport Control Protocol 
* Layer 4
* One of the protocols of "Internet Protocol Suite" - TCP/IP
* "Provides reliable, ordered, and error-checked delivery of a stream of [bytes] between applications running on hosts communicating via an IP network"
* "Major internet applications such as the World Wide Web, email, remote administration, and file transfer rely on TCP"
* Connection-oriented

note: 
* Reliability comes from connection oriented characteristic. Each packet is individually addressed and routed. If a packet is lost, it is resent.
* High Latency
* Lots of overhead


### TCP and the Three Way Handshake

* TCP is Connection-oriented -> 
	1. Build a connection
	2. Send data
	3. Tear down connection
* 3 Types of Packets exchanged:
	initiator -> SYN
	server    <- SYN ACK
	initiator -> ACK

![3 Way Handshake](3-way-handshake.gif)


### Ports: Open vs. Closed vs. Filtered

Open: 		Send SYN -> Receive SYN ACK
Filtered: 	Host behind a firewall - packets addressed to this port could get dropped - no response
Closed:		Send SYN -> Receive RST


### NetCat, a localhost listener, and a simple TCP connection
Open a port with netcat to accept TCP connections: `nc -l 10001`
Establish TCP connection with host on a given port `nc 127.0.0.1 10001`

note: wireshark/nc demo with 127.0.0.1:10001
nc 127.0.0.1 10001
1st. (wireshark filter: ip.addr == 35.189.136.31)
2nd. (wireshark filter: ip.addr == 35.189.136.31 and tcp.port == 10001)


### Simple 3-way Handshake Demo

Try it yourself!
1. open wireshark `alt-f2 -> wireshark`, start listening on loopback interface
2. open a netcat listener `nc -l 10001`
3. from another terminal, connect to your listener `nc 127.0.0.1 10001`
4. Observe successful 3-way handshake


### Unsuccessful 3-way handshake demo

Attempt to connect on a port that is not open
1. close current wireshark session - restart listening on loopback interface
2. open a netcat listener, same as before `nc -l 10001`
3. from another terminal, attempt to connect *but this time on the wrong port* `nc 127.0.0.1 10002`
4. Observe unsuccessful 3-way handshake



### NMAP

NMAP is a FOSS (free and open-source) Network Mapper. It scans an IP address (or addresses) for active ports - **which could represent vulnerable processes running on the host**.


### Features of NMAP

* Asynchronous/Parallel scanning of ports
* Grabs SSH hostkeys when it finds port 22 - SSH server active
* Attempts fingerprints processes if finds on open ports
* Attempts to fingerprint hosts
* Obfuscation (don't use NMAP on eduroam!)

note: 
* Fingerprints processes by port number and server banner - e.g. SSH
* Fingerprints host OS's based a variety of criteria - matches against a db of know host fingerprints


### NMAP scan techniques:

* sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scans
* sU: UDP Scan
* sN/sF/sX: TCP Null, FIN, and Xmas scans
* -scanflags <flags>: Customize TCP scan flags
* sI <zombie host[:probeport]>: Idle scan
* sY/sZ: SCTP INIT/COOKIE-ECHO scans
* sO: IP protocol scan
* `b <FTP relay host>: FTP bounce scan


### NMAP Firewall/IDS evasion and spoofing

* -f; --mtu <val>: fragment packets (optionally w/given MTU)
* -D <decoy1,decoy2[,ME],...>: Cloak a scan with decoys
* -S <IP_Address>: Spoof source address
* -e <iface>: Use specified interface
* -g/--source-port <portnum>: Use given port number
* --proxies <url1,[url2],...>: Relay connections through HTTP/SOCKS4 proxies
* --data <hex string>: Append a custom payload to sent packets
* --data-string <string>: Append a custom ASCII string to sent packets
* --data-length <num>: Append random data to sent packets
* --ip-options <options>: Send packets with specified ip options
* --ttl <val>: Set IP time-to-live field
* --spoof-mac <mac address/prefix/vendor name>: Spoof your MAC address
* --badsum: Send packets with a bogus TCP/UDP/SCTP checksum

note: -S <IP_Address>: Spoof source address


### NMAP demo

* start netcat listener `nc -l 10001`
* start wireshark listening on loopback interface
* run nmap against your own computer: `nmap -A 127.0.0.1`
* view report
* observe successful 3-way handshake where NMAP detected open port 10001:
	wireshark filter `ip.addr == 127.0.0.1 and tcp.port == 10001`
* observe unsuccessful 3-way handshake where NMAP detected closed port 10001:
	wireshark filter `ip.addr == 127.0.0.1 and tcp.port == 10002`
* Check out the shear volume of SYN packets NMAP generates! Nmap blindly tries thousands of ports

note:   -A: Enable OS detection, version detection, script scanning, and traceroute


## Full-scale, remote host NMAP'ing

* NMAP provides an endpoint to scan the shit out of 
* Most networks do *not* want you doing this (shows up on eduroam IDS, for example)
`nmap -A scanme.nmap.org`
* to observe your scan in real-time, fire up wireshark first and start listening on your active network interface (check `ifconfig` for this info [for me, its `eth0`])

note: NMAP scanning is a big-time red-flag, because it is almost exclusively used in 2nd stage of hacking


## shodan.io

* Most OP cybersecurity tool in existence
* Uses tool similar to nmap (its own internally developed port scanner)
* How to seach for `scanme.nmap.org` ?

note: 
1. intentionally fail at searching for scanme.nmap.org
2. demo `nslookup scanme.nmap.org`
3. Show results in shodan; talk about host data that it collects; show CVE's



## The Lab

https://forms.gle/RvkLowy6PCMTjfwG6


# FIN
