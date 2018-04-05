# CCDC Recap

By: Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## CCDC Recap


## We Made It


Clemson University, Kennesaw State University, Mercer University, University of Central Florida, University of Florida, University of North Carolina – Charlotte, University of North Carolina – Wilmington, University of South Alabama


# Shoutout

1. Weston Belk
2. Kenneth Simpson
3. Andrew Samuels
4. Max Harley
5. Carson Sallis
6. David Houston
7. Kyle Wolfe


### Wat


![isestart1](isestart1.png)


![isestart2](isestart2.png)


![isestart3](isestart3.png)


## Papa Bless

![unluckystart1](unluckystart1.png)
![unluckystart2](unluckystart2.png)


## Network Topology


![topology](topology.png)


## Box List

![boxlist](boxlist.png)



## Feedback


### Judge


#### System Configuration

* The team I observed seemed to spend the majority of their time (at least 2 hrs) just configuring the systems.
* They struggled with just getting networking and DNS functional.
* The team I observed struggled with networking in general and could have greatly benefited from an SOP just to get things operational.
* I see a distinction between basic configuration for operations vs hardening to avoid attack.


#### Injects

* This was my favorite part of the exercise as I feel it has the most real world applicability.
* P3 instructed that a vulnerability scan be performed using NMAP.
* I wasn’t clear on whether this was a trick question due to the fact nmap isn’t that effective for vulnerability info.
* The Clemson team just performed the nmap scans but got little to no meaningful data from it.


#### Injects

* P4 was a resource intensive inject that the Clemson team never had time to address.
* It was odd that tool guidance was given for P3 but not for P4.


#### Time

* 3 hours didn’t seem to be sufficient for a quality experience especially given the configuration challenges.
* If substantial configuration challenges exist, then two hours of setup and hardening seemed to be warranted prior to Red team activity.
* A more limited time of Red team activity would allow the teams to both harden properly and go through a[n IR] follow-up process.


#### Service Monitoring

* There was a lot of confusion for the Clemson team around service monitoring.
* They were hesitant to disable potentially compromised accounts due to the potential it would impact the service.
* This led to a continual compromise of the servers.
* **Providing the teams with a list of required accounts for service monitoring that are not touched by Red Team seems to be a more fair approach.**


![orgchart1](orgchart1.png)


![orgchart2](orgchart2.png)


![orgchart3](orgchart3.png)


![orgchart4](orgchart4.png)


![orgchart5](orgchart5.png)


### Me


#### What we did well

1. Worked as a team
2. Got injects in!!!


#### What we did not do well

1. Negative service uptime
2. Injects were laaaate


### Linux


#### Things we did well

1. Cut our losses on the CentOS box and wiped it
2. Got a service up! Woo mailserver!
3. No major compromises...? Maybe?


#### Things we did not do well

1. Get services up
2. Configure boxes quickly


### Windows


#### Things we did well

1. Turned off Windows Server 2003
2. Kept Server 2012 box working for injects
3. Restarting AD


#### Things we did not do well

1. Restarting AD
2. Communication with Nick
3. Non-DNS DNS configuration
4. Shut down Windows 2012 Server
5. Playbook that does not require scripting
6. Put service config in playbook



# Questions?
