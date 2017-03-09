# Introduction To Protocol Reverse Engineering 

By: Foster McLane, Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What, Why, and Problems 


## What

* Protocol Reverse Engineering is the process of extracting the application level protocol with out the specific formal documentation
* This can be both fun...And daunting...


## Why 

* Knowledge of application-level protocol format is essential for many network security applications
* For example:
    - Vulnerability Discovery
    - IDS
    - Signature based fingering
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
    - Pcap Files
    - Proxy intercepts
* You can start with any combination of the above inputs
    - All Three would be ideal


## Identify Protocol Attributes

* Protocol structure
* Protocol flow
* Command list
* Input range
* Output range
* Encoding
* Model location


### Protocol Structure

* This is the layout of control signaling, metadata, and payloads for each command


### Protocol Flow

* The timing, order and size of each command/packet
* This also includes direction of flow and the response


### Command List

* The set of commands that a client/server can send or receive
* This is going to be the basis of your functions


### Input Range

* This is the range of valid data
    - For example: The client will accept values between 1 and 100 for the users level
* Sending invalid data to a program is a good way to learn how it handles unexpected behavior
* This is also a great place to start poking for vulnerabilities


### Output Range

* This is the range of valid return values
    - For example: You level up your character the return value must be between 1 and 100
* Sending invalid data to a program is a good way to learn how it handles unexpected behavior
* This is also a great place to start poking for vulnerabilities


### Encoding

* This is how each protocol is transformed before it will be transmitted and shot down the OSI/IP models
* Malicious programs will often transform themselves before transmission to evade IDS detection


### Model Location

* Where on the OSI/IP Models does the protocol exist
* Typically protocols exist at the application level



# Protocol States!


## States!

* Idle
* Interactive
* Download
* Upload
* Error


### Idle

* This is what the protocol does when "nothing" is happening
* For malicious programs this could mean the person who owns the program is not using it
    - For example: The hacker has a backdoor installed on your computer but is not using it. The back door will signal to the owner some information (Beaconing)


### Interactive

* There is two way communication going on between client and server
* In a malicious program this could be the attacker is issuing commands to the system and the system is replying to the attacker


### Upload

* This is a one way communication where data is pushed from client to server
* In a malicious program this could be the attacker uploading further malware to your system


### Download

* This is a one way communication where the client pulls data from the server
* In a malicious program this could be the attacker stealing your dank memes


### Error

* This is what the protocol does in case of an error.



# Getting Started


## Where To Start

* Start with a well documented protocol
* Become familiar with socket based software development
* IRC is a good place to start because its in plain text


## First step

* A good place to start is capturing traffic between client and server
* Repeat the same command multiple times (This is called command replay)
    * Look for patterns in the packets of the same command


## Analyzing data

```
50 52 49 56 4d 53 47 20  23 73 6f 6d 65 74 65 73 PRIVMSG #sometes
74 63 68 61 6e 6e 65 6c  20 3a 74 68 69 73 20 69 tchannel :this i
73 20 61 20 74 65 73 74  20 6d 65 73 73 61 67 65 s a test message
0d 0a                                            ..
```


## Identify Patterns

```
PRIVMSG #sometestchannel :this is a test message..
```
* This data was pulled from the IRC communication

Note:
* PRIVMSG [channel name] :\[message\][terminator]
* Don't for get the .. which is 0d 0a


## Heads/Terms

* Most protocols have a header to signify the start and a terminator to signify the end
* English language follows this rule too!
* When looking for a header/terminator the idea is to look for something all packets share in common with one another
Note:
* (Capitol letter) (Sentence) (Punctuation)


## Implement Your Guess

* Next step would be to build a program that will implement your guess and see if it works!


## Continued with Foster
