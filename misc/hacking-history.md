# The History of Hacking

By: Nick Bulischeck, Max Harley, Weston Belk, Cameron Ogle, Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## The History of Hacking


### The Definition of "Hacker"

1. an adherent of the technology and programming subculture
2. someone who is able to subvert computer security

### Secrets & Lies - Bruce Shneier

* Defines Security in terms of Properties of Systems:
	- Complex
	- Interactive with Other Systems
	- Emergent Properties
	- Has "Bugs" - Bad Emergent Properties

Note: 
Emergent Properties: systems do things that are not anticipated by the user. Could be good or bad. "In philosophy, systems theory, science, and art, emergence occurs when "the whole is greater than the sum of the parts," meaning the whole has properties its parts do not have. These properties come about because of interactions among the parts " -Wikipedia

# The Difficulty of Securing Systems

* Proving System Security is attempting to prove a Null Hypothesis
* Impossible to prove that a system is secure, only to prove that its insecure

Note:
A system being secure is based on a null hypothesis: its impossible to prove that a system is secure, its only possible to prove that its insecure. Just as in software testing in general, where its impossible to prove that a piece of code contains no bugs. Disproving the null hypothesis proves nothing; the best you can say about a system is that "noone has been able to prove that its insecure."


# Computer Security

* General Computer Security defined
* 3 Aspects:
	1. Confedentiality
	2. Integrity
	3. Availability

Note:
General Computer Security: "The prevention and/or detection of unauthorized actions by users of a computer System."
Confidentiality: Stop unauth. users from reading sensitive info
Integrity: Every piece of data is as the last authroizd modifier left it.
Availability: The property that a prodyct's services are accessible when needed and without undue delay," or "the property of being accessible and usable upon demand by an authorized entity."

## Older than Old-School Hacking


### Wireless Telegraph

* Invented by Guglielmo Marconi
* Telegraph that could broadcast radio-telegraphic messages
* Broadcasts on a specific wavelength to establish private communications channels.


#### Wireless Telegraph Hack

* John Nevil Maskelyne
* Man-on-the-Side Attack
* Raced Marconi's anticipated message to mock him

Note:
This happened in June 1903 during a public demonstration by Marconi.


### Nazi Census

* Nazis invaded France in 1940 and demanded a census
* Census forms were compiled onto tabulator cards supplied by IBM
* Column 11 indicated the citizen's religion


#### Nazi Census Hack

* René Carmille
* Requested to be in charge of the tabulator cards
* Instructed to print a list of all Jewish people living in France
* Mishandled punch cards, hacked his own machines

Note:
Carmille reprogrammed his machines to never punch information from Column 11 onto any census card. He was eventually found out 4 years later and sent to Dachau. As a result of his actions, Carmille saved an untold number of lives. 



## Old-School Hacking


### MIT Tech Model Railroad Club

* First reference to "hacking"
* Mid-1950s meeting notes
* Eventually lead to the discussion of telephone hackers years later
* "mischief pulled off under a cloak of secrecy or misdirection"
* http://hacks.mit.edu/Hacks/

Note: 
Documentation of MIT's more benign "hacks"
https://www.youtube.com/watch?v=IAIPUGO1iko


### Phone Phreaking

* Exploring/exploiting the telephone system
* Started late 1950s 
* Golden age of late 1960s, early 1970s
* Exploring the telephone network wasn't (and isn't) illegal, in and of itself

Note:
But phone phreaks sometimes used their skills to make free telephone calls, and that was illegal


#### Wargames Phreaking

Note:
https://vimeo.com/groups/349208/videos/152524870#t=1h4m35s


#### John Draper

* ![Captain Crunch](captain-crunch.jpg)

Note:
This whistle emitted the same frequency that AT&T long lines used to indicate that a trunk line was available for routing a new call.


### Morris Worm (1988)

* Robert T. Morris
* 23-Year-Old Grad Student from Cornell
* Exploited known vulnerabilities in Unix sendmail, finger, and rsh/rexec, as well as weak passwords
* Not written to cause damage, but to highlight security flaws


#### Morris Worm Damage

* The same computer could be infected multiple times leading to a fork bomb effect
* Took down 10% of the Internet's computers at the time
* U.S. Government Accountability Office put the cost of the damage at $100,000–10,000,000


### ILOVEYOU (2000)

* "LOVE-LETTER-FOR-YOU.txt.vbs"
* Sent a copy of itself to all addresses in the Windows Address Book used by Microsoft Outlook
* Philippines -> China -> Europe -> US


#### ILOVEYOU Damage

* $5.5–8.7 billion in damages worldwide
* Estimated to cost $15 billion to remove the worm
* 50 Million Infections
* The Pentagon, CIA, the British Parliament and most large corporations decided to completely shut down their mail system



## Modern Day Hacking


### Cyber Warfare


#### Russo-Georgian War

* August 5th 2008
* Baku–Tbilisi–Ceyhan pipeline was subject to a terrorist attack near Refahiye in Turkey
* Sophisticated computer attack on line's control and safety systems that led to increased pressure and explosion


#### Stuxnet

* Malicious worm first discovered in 2010
* Targeted SCADA systems
* Designed for PLCs in Iran's nuclear program
* Exploited four zero-days in Windows


### Hacktivism

* the use of technology to promote a political agenda or a social change
* free speech, human rights, or freedom of information movements


#### Anonymous

* Appeared on 4chan during 2003
* Rise in 2008 after a DoS attack on the Church of Scientology
* Took down 10k Dark web sites related to CP

Note:
The dark web takedown was accomplished by compromising a private web hosting service named Freedom Hosting II.


#### WikiLeaks

* WikiLeaks was founded in 2006 by Julian Assange
* "multi-national media organization and associated library"
* Primarily associated with whistleblowing
* Julian Assange currently resides in the Ecuadorian Embassy in London


#### LulzSec

* Formed in May 2011
* Five members of Anonymous
* "Sabu," "Kayla," "T-Flow," "Topiary," "AVUnit," and "Pwnsauce"
* Hacked HBGary, Fox Television, Tribune Company, PBS, Sony, Nintendo, and Senate.gov


##### Lulzsec Downfall

* Hector Monsegur (Sabu) logged into IRC without a proxy
* FBI immediately had him, he folded fast
* Eventually all of the other members were ratted out
* "He’d do anything for his kids. He didn’t want to go away to prison and leave them. That’s how we got him."


### Bug Bounty Programs

a deal offered by many websites and software developers by which individuals can receive recognition and compensation for reporting bugs, especially those pertaining to exploits and vulnerabilities


#### First Bug Bounty

* Hunter & Ready
* 1983
* Versatile Real-Time Executive operating system
* Reward: Volkswagen Beetle (aka Bug)


#### Companies with Bug Bounty Programs

* Mozilla
* Facebook
* Yahoo!
* Google
* Reddit
* Square
* Microsoft

Note:
https://hackerone.com/bug-bounty-programs
https://www.bugcrowd.com/bug-bounty-list/


#### Responsible Disclosure


## Conferences

### DEFCON

![DEFCON](dickhead.jpg)

Note:
* What do you all know about DEFCON?


### BlackHat

![BlackHat](blackhat.jpg)

* DEFCON, but for professionals


### Shmoocon

* Washington DC
* Limited tickets
