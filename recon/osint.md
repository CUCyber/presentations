## OSINT

Or, how to stalk your friends

CU Cyber



## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## Ethics Statement

* Don't do anything illegal. It's not worth it.
* Don't do anything sketchy. It's probably illegal.



## General Intelligence

* Have a goal
* Intelligence is good, but one has to parse it
* Intelligence has an expiration date

Note:
* Limit the amount of intel to what satisfies your goal
* "Big data problem"



# OSINT

Note:
* Can someone explain what OSINT is?



# ReconNG

Note:
* Best Open Source OSINT platform
* Tim Tomes



## ReconNG

* Modules
* Database

Note:
* Modules take an input and give an output



## How to Use

* `show profiles`
* `use recon/profiles-profiles/profiler`
* `show info`
* `set SOURCE harmj0y`
* `run`
* `show profiles`



## First Goal

* Physical pentest
* Reach server room

Note:
* What do we want?
* Info about the company
* Info about employees



## Company - Info

Gathers the registered IANA Private Enterprise Number (PEN) contact from the PEN registry.

* `add companies`
* `use recon/companies-contacts/pen`
* `run`



## Company - People

Uses the ARIN Whois RWS to harvest companies, locations, netblocks, and contacts associated with the given company

* `use recon/companies-multi/whois_miner`
* `run`



## People

* `show contact`



## Location

* `show locations`



## Now What?

Note:
* We have all the data we can get from ReconNG
* Google `Poole Hall Rm 11`
* Google maps
* Employee social media - badge pictures


## Quick OSINT Story



## Second Goal

* Red Team assessment

Note:
* What do we want?



## Company

Add company to DB

* `add company`
* `use recon/companies-domains/pen`
* `run`



## Domains

* `use recon/companies-domains/pen`
* `run`



## Subdomains

Harvests hosts from Google.com by using the 'site' search operator.

* `use recon/domains-hosts/google_site_web`
* `run`



## What Now?

* We arn't actually going to pentest anything, so we stop
* But what else can we find?

Note:
* Port scan, but that would be active scanning!
* Have someone else do it



## Shodan

* shodan.io



## Google Dorks

* filetype:
* inurl:
* intitle:



## Other OSINT Tools

![osint](recon.png)



# Questions?
