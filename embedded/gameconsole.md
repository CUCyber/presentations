# Game Console Security

By: Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# A Brief History


## Super/Famicom
### (S/NES)

* 10NES
* Checking Integrity Circuit
* Piracy
* Region Lockout
* Disk System


## Nintendo 64

* Checking Integrity Circuit
* Piracy
* Region Lockout


## Networking

* Extra pressure on console integrity
* Server-side enforcement of game logic


## DS

* Peer-to-peer
* Restricted memory areas
* Checksums
* Save timing
* I will be talking about this one


## Wii

* Modern encryption
* Isolated and encrypted portions
* I will be talking about this one


## PS3

* Modern encryption
* Hypervisor based
* I will be talking about this one



# Nintendo DS


## Flashcarts

* GBA flash cartridges still worked
* Worked to run arbitrary code with signed header


## Cartridge

* Encryption (Blowfish)
* KEY1/KEY2
* Secure Area
* Signing (RSA on DSi)



# Nintendo Wii


## Cryptography Upgrade

* AES-128-CBC
* RSA
* ECC


## Discs

* Encrypted with AES to prevent analysis
* Signed to avoid modifications
* Each partition has its own AES key
* Partition keys stored in ticket encrypted with master key
* Groups of hashes of all parts of disc encrypted with RSA
* Contain system updates


## Saves

* Encrypted with common AES key
* Signed with console's private key
* Public key included and signed with Nintendo's private key


## Tweezer Attack

* Extracted the master key out of firmware
* Uses tweezers to bridge connections to Wii's memory during Gamecube mode
* Uses existing Gamecube exploits to run arbitrary code in Gamecube mode to map areas of memory bits at a time


## Twilight Princess

* Exploit in handling of character name code to map and execute from SD card


## Homebrew

* After the Twilight Princess hack, everything opened up from there



# PS3


## Other OS

* PS3 allows you to run another Linux OS on your console
* Added to allow Sony to consider them as personal computers for tax reasons
* Runs in a hypervisor that prevents access to GPU and other devices


## Discs

* Encryption key stored in ROM Mark
* ROM Mark is something only licensed Blu-Ray manufacturers can make


## Hypervisor

* Runs on main processor and one of seven coprocessors
* Coprocessor is in isolation mode meaning even the main processor cannot access its memory
* Root keys for decrypting bootloader and hypervisor are in hardware


## HTAB
### Hashed Page Table

* Contains mappings to virtual segments
* Performs timing attack in which the circuit is glitched with an electronic pulse
* Prevents deallocation of mapping which gives kernel access to arbitrary memory space


* Tries to allocate more segments until the HTAB for one shows up in the arbitrary memory space
* Adds mapping to main segment thus giving control of all memory 
* Dumps hypervisor code and reverse engineer it for vulnerabilities



### Dedicated to the late
## Ben "bushing" Byer
#### And all of those who made these things possible



# Questions?
