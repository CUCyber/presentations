# Information Gathering Foundations

By: Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# Intro...to the Intro


## Topics

* Why is information gathering important?
* What should you be looking for?
* How to orgainize your information.
* What tools are there to help you find things?


## Why is information gathering important?


### Attacking

* You don't know what you don't know
* Increases surface area for attack
* Gives you the ability to orgainize an attack more effectively

Note: 
* You never know when bit of information will be handy!


### Defense

* You don't know what you don't know
* Knowing what is on your network
* Knowing who is on your network
* How an action would impact your network and the domino effect that follows

Note:
* Knowing what/who is on your network, allows you to respond more quickly 


### Example

* A new exploit for Adobe Flash comes out, how would you respond?

Note:
* First you would want to find all of the servers that are running the version of adobe flash affected by this vulnerability.
* If you have a list pregenerated you can respond immediately, and possibly before damage is done



# I Spy with my little eye...


## What to record

* You should be recording everything
* Even small details can be important
* Overwhelmed? Orgainization is your friend

Note:
* Details all the way down to what is someones favoirte color can be important (Password cracking)
* Use tools to help you orgainize thoughts: OneNote, Good naming conventions, well thought out groupings of information.


## Thing 1...Thing n

* Take screenshots
* Save scan outputs
* Save interesting URLs
* Save employee lists
* etc.

Note:
* Anyone have any idea what else would be good to record?


## Record your actions

* If you are able to comprimise something, record how
* Will ensure you are always moving forward
* Could save you a lot of legal trouble

Note:
* Keeps you from doing the same thing multiple times
* If you are doing pentesting on a network you want a paper trail of what you did so that you can back up your claims if they ever come under fire
* You want reproducable results, this is a science



# Get Orgainized


## Tools for Orgainization

* OneNote (Windows)
* Evernote/Google Keep
* Notepad
* Excel
* Vimwiki/Emacs Org-mode
* etc.


## Tips for use

* Make sure to categorize your data well
* Dont just stick everything in one document
* Keep data up to date
* Use tags to speed up searching #findme

Note:
* All the tools in the world are useless if you do not have a good workflow
* Proper use can speed up your process



# Nitty Gritty


## Basic Tools

* Google/Google Dorks
* nmap
* dmitry
* Nessus Security Center
* Wireshark
* Metasploit
* Nikto
* And More!


## Google Dorks

* Dorks are crafted searches that make use of google searching tools
* [Dork Database](https://www.exploit-db.com/google-hacking-database/)
* [Online Cameras](inurl:/view/viewer_index.shtml)
* [DD-WRT Routers](https://www.exploit-db.com/ghdb/3814/)

Note:
* Second Link is good example


## Nmap
* Namp is a great too for enumerating your network and finding devices and services that are running
* nmap -A 10.20.18.25 (to start) 


## Dmitry
* Dmitry is a powerful who is too
* dimtry clemson.edu


## Wireshark
* Wireshark is a user friendly packet sniffing tool for monitoring your network

Note:
* Please dont use this on public networks
* tcp port 1234
* if you wanted to capture ssh traffic what would you use?


## Metasploit
* You may have heard that metasploit is just an offensive toolkit but it has recon packages available to it.

Note:
* Versioning of software
* ssh versioning:
* use auxiliary/scanner/ssh/ssh_version
* set RHOST
* run


## Nikto
* A great starting too for gathering information on webservers
* gives alot of information on webservers 

Note:
* Nikto -h 10.20.18.25
* Walk through some of the information
