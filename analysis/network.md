# Reverse Engineering Network Protocols

By: Mackenzie Binns & Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# What, Why, and Problems 


## What

* Protocol Reverse Engineering is the process of extracting the application level protocol with out the specific formal documentation.
* This can be both fun... and daunting...


## Why 

* Knowledge of application-level protocol format is essential for many network security applications
* Examples
    - Vulnerability discovery
    - IDS
    - Signature based fingerprinting
    - Detecting services running on non-standard ports


## Problems

* Problems with reverse engineering grow as the protocol becomes more complex
* Encrypted protocols may be impossible to reverse engineer
* Why not automate it?:
    - Falls under a category called NP-complete



# How do I start?


## Identify Inputs

* Client binary or source code
* Server binary or source code
* Captured or live network traffic
    - Pcap files
    - Proxy intercepts
* You can start with any combination of the above inputs
    - All three would be ideal


## Identify Protocol Attributes

* Protocol structure
* Protocol flow
* Command list
* Input range
* Output range
* Encoding
* Model location


### Protocol Structure

* This is the layout of control signaling, metadata, and data for each message


### Protocol Flow

* Timing, order and size of each message
* Includes direction of flow and the response


### Command List

* The set of commands that a client or server can send and receive
* This is going to be the basis of your functions


### Input Range

* This is the range of valid data
    - e.g. the client will accept values between 1 and 100 for the users level
* Sending invalid data to a program is a good way to learn how it handles unexpected behavior
* This is also a great place to start poking for vulnerabilities


### Output Range

* This is the range of valid return values
    - e.g. you level up your character the return value must be between 1 and 100
* Aqain, sending invalid data to a program is a good way to learn how it handles unexpected behavior


### Encoding

* This is how each protocol is serialized before it will transmitting over a standardized protocol
* Malicious programs will often re-encode themselves before transmission to evade detection by an IDS


### Model Location

* Where in the OSI or IP model does the protocol exist
* Typically protocols exist at the application level



# Protocol States


## States

* Idle
* Interactive
* Download
* Upload
* Error


### Idle

* State of the protocol when nothing is happening
* For malicious programs this could mean the person who owns the program is not using it
    - e.g. the hacker has a backdoor installed on your computer but is not using it (the back door may signal to the owner some information called beaconing)


### Interactive

* State of the protocol when two way communication is going on between client and server
* In a malicious program this could be the attacker issuing commands to the system and the system replying to the attacker


### Upload

* State of the protocol during one way communication where data is pushed from client to server
* In a malicious program this could be the attacker uploading further malware to your system


### Download

* State of the protocol during one way communication where the client pulls data from the server
* In a malicious program this could be the attacker stealing your dank memes


### Error

* State of a protocol when an error occurs on either end



# Getting Started


## Background

* Start with a well documented protocol
* Become familiar with socket or datagram based software development
* IRC and SMTP are good places to start because they are in plain text


## First Step

* The first step in protocol analysis is capturing the network traffic
* Repeat the same command multiple times (called command replay)
    * Look for patterns in the packets of the same command


## Analyzing Data

```xxd
50 52 49 56 4d 53 47 20  23 73 6f 6d 65 74 65 73 PRIVMSG #sometes
74 63 68 61 6e 6e 65 6c  20 3a 74 68 69 73 20 69 tchannel :this i
73 20 61 20 74 65 73 74  20 6d 65 73 73 61 67 65 s a test message
0d 0a                                            ..
```


## Identify Patterns


### IRC Message

```irc
PRIVMSG #sometestchannel :this is a test message..
```

Note:
* PRIVMSG [channel name] :\[message\]\[terminator\]
* do not forget the .. (`0d 0a`)


## Headers and Terminators

* Most protocols have a header to signify the start and a terminator to signify the end
* English language follows this rule too!
* When looking for a header or terminator the idea is to look for something all packets share in common with one another
Note:
* \[capitol letter\] \[sentence\] \[punctuation\]


## Implement Your Guess

* Next step would be to build a program that will implement your guess and see if it works!



# Network Protocol Structure


## Levels

* Socket Stream
* Datagram Packets
* High Level API (e.g. HTTP)
* Somewhere in between?


## Examples

* Discord API - WebSocket based
* Overwatch Multiplayer Sessions - UDP based
* Minecraft Authentication API - HTTP based



# How To Reverse Engineer a Protocol


## Tools

* Wireshark - sniffer
* Burp Suite - proxy
* mitmproxy - proxy
* Web browser developer tools - client


## Methods

* Generally start by analyzing the highest level standardize protocol
* Work up from there based on data organization


## Examples

* Discord - JSON over WebSockets
* Overwatch - UDP datagrams
* Minecraft - JSON over HTTPS



# Minecraft Auth API


## Legacy


### Endpoints

* `http://login.minecraft.net/`
* `http://session.minecraft.net/game/joinserver.jsp`
* `http://session.minecraft.net/game/checkserver.jsp`


### Login


#### Parameters

* `user`
* `password`


#### Response

* version
* `deprecated`
* username
* session id


### Join Server


#### Parameters

* `user`
* `sessionId`
* `serverId`


#### Response

* `OK` or `Bad login`


### Check Server


#### Parameters

* `user`
* `serverId`


#### Response

* `YES` or `NO`


## Yggdrasil


### Endpoints

* `https://authserver.mojang.com/`

* `authenticate`
* `refresh`
* `validate`
* `signout`
* `invalidate`


### Authenticate


#### Parameters

* `username`
* `password`


#### Response

* `accessToken`
* `clientToken`


### Refresh


#### Parameters

* `accessToken`


#### Response

* `accessToken`
* `clientToken`


### Validate


#### Parameters

* `accessToken`


#### Response

* none or error


### Signout


#### Parameters

* `username`
* `password`


#### Response

* none or error


### Invalidate


#### Parameters

* `accessToken`


#### Response

* none or error



# What does this mean?


## Man-in-the-Middle Attacks

* Difficult to stage with the newer authentication because of the use of HTTPS
* An attack could successfully steal someone's Mojang session or even their account
* For more compromising protocols (e.g. an internal messaging system at a company) this can be very bad


## Capes!

* Capes are fetched from `http://s3.amazonaws.com/MinecraftCloaks/<username>.png`
* A carefully crafted proxy server is able to grant you capes
	- Note this cape is only viewable to those on the proxy


## Alternative Authentication

* An implementation of this system can be created (see https://github.com/fkmclane/MCAuth)
* A proxy server can be created for a specific group of players
* A whole custom system from usernames to skins to capes to forum authentication is possible


## What about multiplayer protocol?

* Chunked world communication and clocked events based
* Out of the scope of this presentation but easy enough as a fun exercise
* Try creating a bot with this knowledge!



# Questions?
