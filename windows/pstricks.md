# PowerShell Tips and Tricks

By: Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# Setting Up Your Environment


## Privilege Errors


### Administrator Mode

* Modifying the user privileges will error when the current PowerShell or PowerShell ISE are not run as Administrator, see image below
	- Right-click and select run as administrator when starting the PowerShell application.

![Execution Policy Change](img1.png)


### Execution Policy

* Running the tool will error when the current PowerShell or PowerShell ISE are run using the default execution policy, see image below
	- Update the default execution policy administrator mode by typing: `Set-Execution policy undefined`

![Execution Policy Error](img2.png)



# Useful modules



## Active Directory


### Get-ADUser

```powershell
Get-ADuser –server <Domain> -properties <AD Property you want> `
	-filter{<ADproperty –like <value>}
```


### Get-ADComputer

```powershell
Get-ADComputer –server <Domain> -properties <AD Property you want> `
	-filter{<ADproperty –like <value>}
```


### Get-ADGroup

```powershell
Get-ADGroup –server <Domain> -properties <AD Property you want> `
	-filter{<ADproperty –like <value>}
```



## File Operations


### Get-Content

* This pulls in ANY file you want it to


### Import-CSV

* Pulls in well formatted CSV files and creates objects with properties based off the first row data (column headers) and all data following will be lined up and matching
* If you need a CSV from an Excel file you can export to CSV from within Excel
*PowerShell is AMAZING for CSV files, please do not use VBS for CSV please take the time to learn PowerShell


### Export-CSV

* This allows you to take and collection of objects and create a CSV file
* First row column headers will be the properties the objects share and the data will be put under that
* Use –notypeinformation flag to remove system messages from output


### ConvertTo-CSV

* This allows you to convert your data into a CSV right into memory with no need to output to a file
* Use –notypeinformation flag to remove system messages from output


### Import-Excel

* Must have package installed - https://github.com/dfinke/ImportExcel


### Export-Excel

* Must have package installed - https://github.com/dfinke/ImportExcel


### Out-File

* Allows you to output a file as any type you want



# Pipelining


## Basics

* '|' is the pipe operator in PowerShell this allows you to pass the output of one operation directly into another


## Common Pipes


### Where-Object

* Allows you to filter an object based on a condition such as

```powershell
 | Where-Object($_.name –eq "Mack")
```


### Select

* Allows you to select a specific property of an object to use
* This is good to use if you have a ton of properties and only need a few (Active Directory has a lot of properties)


### Select-Object

* This allows you to preform operations on a specific property of an object while still selecting the whole object
* Not to be confused with the simple select which isolates the specific property
* This is good for operating on column names if you need to change them and also for doing operations on all instances of that property


### Select-Object (cont.)

* The example below would append 'Hi' to any property you want also allowing you to rename the header

```powershell
 | Select-Object @{name=<columnheader>;expression={$_.<property> + Hi}}
```


### Sort

* Sorts an object by a specified property, default is ascending


### Almost every other native PowerShell module can have piped input

* Give it a whirl, you can pipe output into most modules, in fact many Require you to do so


## Accessing data that has been piped in

* To access data that you are piping in use the system defined variable `$_`
* `$_` is still the complete object you defined to pass in


## Accessing data not piped in

* Just reference the variable as normal
* Keep experimenting with this one as it can allow you to do many operations quickly and is a key feature of PowerShell



# .NET Objects


## Basics

* PowerShell has full access to the whole .NET framework of objects, classes, and functions



# Error Handling


## Basics

* Wrap functions and modules in try/catch statements when you want to handle the potential errors
* `$?` Is the system variable for the last error thrown and can be accessed like any other object



# String Operations


## Basics

* The concatenation operator is `+`


## Variables

* When working with variables in strings there are two ways to expand it to show your properties


### $variable

* `$variable` will give you the data in the variable


### $variable.name

* `$variable.name` will throw an error because PowerShell does not know that the .name property is part of the variable


### <span class="tex2jax_ignore">$($variable.name)</span>

* <code class="tex2jax_ignore">$($variable.name)</code> will show you what is contained in the variables name property correctly
	- This works because when you surround something in `$()` you are saying whatever happens in the parenthesis is a variable and to treat it as such, but you also have to reference the variables you want to work with as variables with in the parenthesis as well
	- You can do full on PowerShell expressions inside the parenthesis and it will expand to a string!


## Numbers and Strings

* When working with numbers and strings while trying to concatenate don't forget to use the `.ToString()` operator on your number otherwise you will get funny results!



# Common Operators


## –eq

* Equals, use this when testing for logic and not assignment


## –like

* This operator allows you to use the `*` wildcard in a string when looking for something


## –match

* This operator allows you to use regex expressions to find patterns, very useful when parsing data in CSV's or Excel docs
* Uses Perl RegEx


## –contains

* Looks for a string within a string
* This operator does not do operations against a string; it only operates on a list. That is, it answers the question "does this list contain a given element?" To check for a whole or partial string match use `-like` or `-match`


## –ne

* Not equal to


## –notlike

* Can use wild cards to find objects that are NOT like when you put in the search


## –gt

* Greater than operator, can be used on Strings and will sort them ascending


## –lt

* Less than operator, can be used on string and will sort them descending



# SQL Connections


## Basics

* You want to create global variables for SQL data object so you do not have to go through your whole script hunting down everyplace you referenced a table or database


## Invoke-SQLCmd

* `-serverinstance`
	- This is the SQLserver name
* `-database`
	- This is the database containing the tables you need
* `-query`
	- This is the SQL statement you want to run
	- Typically a string that you assign to a variable somewhere else in the function
		+ See string operations for using PowerShell variables inside sql statements


## Invoke SQL

* Invoke SQL is the simplest way to access a sql database but it is also low performance and would take many hours to operate on something in the thousands


## High Performance SQL

* There is no need to edit this following block of code, typically plug and play (You should make it a function and pass variables in)


### Define Your CSV Variables

```powershell
$csvdelimiter = "`t"
$FirstRowColumnNames = <$true|$false> # Depends if your column headers are at the top
$csvfile = <Location of CSV file to export to sql>
```

* Your column headers MUST match up with the sql column names
* Data types MUST be able to accommodate the data, most robust is nvarchar with an appropriate length


### Define Your SQL Variables

```powershell
$sqlCommand
$sqlserver
$database
```



# Additional Resources


## PowerShell Characters and Tokens

* http://www.neolisk.com/techblog/powershell-specialcharactersandtokens


## PowerShell Error Handling

* https://blogs.msdn.microsoft.com/kebab/2013/06/09/an-introduction-to-error-handling-in-powershell/


## PowerShell Pitfalls

* https://www.simple-talk.com/sysadmin/powershell/the-poster-of-the-plethora-of-powershell-pitfalls/


## PowerShell + SQL

* https://rahmanagoro.wordpress.com/2010/08/26/powershell-secret-timeout-running-sql-from-powershell-v1/



# Questions?
