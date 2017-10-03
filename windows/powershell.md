# #!/bin/powershell

By: Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



# PowerShell | Get-Member


## What is PowerShell?

* PowerShell is a dynamically typed object-oriented scripting language that was built upon the .NET framework.


## Named Commands You Can Run

* Cmdlets (.NET Framework programs designed to interact with PowerShell)
* PowerShell Scripts (.ps1)
* PowerShell Functions
* Standalone .EXE's



# Get-Command

* Cmdlets are the building blocks on which PowerShell scripts run
	- Cmdlets have all of the functionality .NET provides
* They follow a verb-noun naming convention which attempts to make them self descriptive.
* Cmdlets output results in the form of objects, arrays, or arrays of objects and can take input in any one of those forms
	- Although they can take an array of objects cmdlets always operate on each object in the collection individually in sequence



# Variables "$"

* Variables in PowerShell are simple to define
	- Add a `$` in front of a non-system reserved word and it becomes a variable capable of holding any data type!



# Pipeline "|"

* The pipeline allows passing the output of one command to the input of another similar to Unix pipelines
	- PowerShell pipelines execute in the PowerShell runtime rather than processes to be coordinated by the OS
	- PowerShell passes .NET objects rather than a byte stream to the next cmdlet



# Functions

* Functions are different from modules in that they are defined at runtime and can only be called from within the script in which they reside


## Defining a Function

```powershell
function example ($param1)
{
}
```


## How would you reference a function?

Note:
You would reference it like `example "param1"`.



# Running Your Scripts


## Execution Policy

* Setting that determines if PowerShell scripts can be run on a system (*.ps1)
* Default is <span style="color: red">Restricted</span>
* Never meant to be used as a security feature
	- Though it still is...
* Legitimate way to run .ps1 scripts
	- Run PowerShell as Administrator
	- `Set-Execution policy unrestricted` (unrestricted, unsigned, signed, undefined)
	- ???
	- Profit



# I Am Afraid I Can't Let You Do That...

* Never fear! Execution policies are _easy_ to work around (because they shouldn't be usd as security for your system)


## Method 1

* Paste the script into an interactive terminal and run!
* Good for one liners and other quick actions
* No config change or write to disk


## Method 2

* ECHO and pipe!
* `Echo <script> | PowerShell.exe -noprofile -`
* Good for one liners
* No config change or write to disk


## Method 3

* Run it from the Internet!
* Great for full on scripts
* Actually doesn't get written to disk (RAM) and no config changes
* `PowerShell -nop -c "iex(New-Object Net WebClient).DownloadString('<your site here')"`


## Method 4

* `Invoke-Command`
* Good for script blocks
* Can be used on remote systems
* `Invoke-Command -scriptblock { Write-Host "I am afraid I can't do that Dave" }`



# Get-Help
