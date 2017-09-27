# Information Gathering Foundations

By: Nick Bulischeck, Weston Belk, Foster McLane, Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



## Intro to Info Gathering


### Topics

* Why is information gathering important?
* What should you be looking for?
* How to organize your information.
* What tools are there to help you find things?


### Why Is Info Gathering Important?


#### Attacking

* You don't know what you don't know
* Increases surface area for attack
* Gives you the ability to organize an attack more effectively

Note:
* You never know when a bit of information will be handy!


#### Defense

* You don't know what you don't know
* Knowing what is on your network
* Knowing who is on your network
* How an action would impact your network and the domino effect that follows

Note:
* Knowing what/who is on your network allows you to respond more quickly


##### Example

* A new exploit for Adobe Flash comes out, how would you respond?

Note:
* First you would want to find all of the servers that are running the version of Adobe Flash affected by this vulnerability.
* If you have a list pregenerated you can respond immediately, and possibly before damage is done.



### Recording Your Findings


#### Boxes on the Network
- IP(s)
- Firewall Ports open and closed
- Services running
    * Service Name
    * Service Version
    * Service Purpose
    * Service Port(s)
    * Interface(s) listening


#### Individual Machines
- User permissions and shell
- Group permissions
- Directory permissions
- Purpose of the machine
- Running services


#### Reporting
- Report how you secured the machine.
    * Before/What are the security risks
    * Steps taken
    * After (Result)
- Take screenshots
- Save scan outputs
- Save interesting URLs
- Save account lists


#### Record your actions

* If you are able to compromise something, record how
* Will ensure you are always moving forward
* Could save you a lot of legal trouble

Note:
* Keeps you from doing the same thing multiple times
* If you are doing pentesting on a network, you want a paper trail of what you did so that you can back up your claims if they ever come under fire
* You want reproducable results, this is a science



## Organization


### Tools for Info Organization

* KeepNote (Linux/Kali)
* OneNote (Windows)
* Evernote/Google Keep
* RecordMyDesktop/OBS
* Excel
* Vimwiki/Emacs Org-mode
* etc.


### Tips for use

* Make sure to categorize your data well
* Don't just stick everything in one document
* Keep data up to date
* Use tags to speed up searching #findme

Note:
* All the tools in the world are useless if you do not have a good workflow.
* Proper use can speed up your process.



## Gathering/Demo


### Tools for Info Gathering

* Google/Google Dorks
* nmap
* dmitry
* Wireshark
* Metasploit
* Nikto
* And More!


### Google Dorks

* Dorks are crafted searches that make use of Google searching tools
* [Dork Database](https://www.exploit-db.com/google-hacking-database/)
* [Online Cameras](inurl:/view/viewer_index.shtml)
* [DD-WRT Routers](https://www.exploit-db.com/ghdb/3814/)

Note:
* Second Link is good example


## Nmap
* Nmap is a great too for enumerating your network and finding devices and services that are running
* nmap -A 10.20.18.25 (to start)


## Dmitry
* Dmitry is a powerful whois tool
* dimtry clemson.edu


## Wireshark
* Wireshark is a user friendly packet sniffing tool for monitoring your network

Note:
* Please dont use this on public networks
* TCP port 1234
* If you wanted to capture ssh traffic what would you use?


## Metasploit
* You may have heard that metasploit is just an offensive toolkit but it has recon packages available to it.

Note:
* Versioning of software
* ssh versioning:
* use auxiliary/scanner/ssh/ssh\_version
* set RHOST
* run


## Nikto
* A great starting tool for gathering information on webservers
* Gives a lot of information on webservers

Note:
* Nikto -h 10.20.18.25
* Walk through some of the information
