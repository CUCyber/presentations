# Sitting Duck Review

By: Andrew Samuels

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## What is Daffy Duck's SSN?


### Check the source
![ssn](ssn.png)

* In this case the flag is left in the comments of the page source.
* This is **BAD** coding practice!!



## What is Daffy Duck's department number?


### Check the source
* We can find this flag in the source similar to the first flag.
* Notice on the homepage, there is a dropdown to select departments.

![department](department.png)



## What is the flag for the Administration login page?


* The necessary information is in [robots.txt](sittingduck.cucyber.net:8080/robots.txt)
* robots.txt is used to give information to webcrawlers or spiders.
* In this case, webcrawlers are disallowed access to
[/OU812](sittingduck.cucyber.net:8080/OU812).
* Check the source like before for the flag.



## What is Daffy Duck's Managers User ID?


### Information gathering

* First we determine from the home page that Daffy Duck's manager is
Ebenezer Scrooge.


### Finding the flag

* We can leverage Burpsuite to spider the site.
* Doing so, we find that there is a "forgotten" file called
[Managers-old.txt](http://sittingduck.cucyber.net:8080/Images/Managers-old.txt) in the `/Images` directory.
* Here we can see that Ebenezer Scrooge's user ID is `tiny.tim`



## What is the flag for the Administration Eval page?


* We have a manager's user id and password, but we still can't login.


### Information gathering

* We know that the credentials must be checked against a database, maybe
SQL?
* If we put a single quote `'` in the password form, we get a SQL
error.

`SqlException (0x80131904): Unclosed quotation mark after the character
string '''.`


### SQL Injection

* Once we know the database is SQL, we can try SQL injection.
* We can guess the SQL query is something like the following:

```SQL
SELECT columns
FROM Managers
WHERE password="something"
```


* The query boils down to:
```C
if(check(password))
	login();
```
* But what if the query were changed to look like this:
```C
if(check(password) || true)
	login();
```


* We can do exactly this with the password field with the following input:
```SQL
' OR '1'='1
```
* This changes the query to look like the following:
```SQL
SELECT columns
FROM Managers
WHERE password="something" OR 1=1
```

* And we're in! Check the source for the flag.



## What is the flag for elevating privileges?


### Information gathering.

* Ater SQL injecting the login, we are met with an error message that only
HR can access evaluation scores.
* Let's see if we can make ourselves look like HR with Burpsuite.


* Using Burpsuite as a local proxy, we can forward all of our traffic
through it to capture packets.
* Capturing the SQL injected login packet, we can see the following:

![params](params.png)


* We can see that there is a parameter in the POST request of

`Group=TWFuYWdlcg==`
* This is actually base64, and if we decrypt it, we get "Manager", but we
want to be "HR".


* Let's replace that field with "HR" encoded in base64, which is `SFI=`,
	and forward the packets.

![paramedit](paramedit.png)

* And we're in! Check the source again for the flag.



## What is the flag for the completing the CTF?


### Information gathering
* We are trying to edit Daffy Duck's evaluation, so we need his Department
Number and Employee Number.
* We have the department number, but we need to find the employee number
somewhere.
* Maybe the search bar on the homepage can help us?


* If we put in a single quote like before, we find that this also accesses
a SQL database.
* Let's think about the query again, it should look something like this:
```SQL
SELECT employee, department, phone, ssn
FROM some_table
```


### Necessary SQL concepts


#### Union

* Essentially, we want to pull in a new set of information that has the
same amount of columns as the query.
* This can be accomplished with `UNION`, which can be thought of stacking
queries on top of each other.


#### Information Schema

* In SQL, there is a table called `INFORMATION_SCHEMA` which contains
metadata about other tables.
* We can select from `INFORMATION_SCHEMA.COLUMNS` to see what we have in
the database.


* The following query will list out what we have in the database:
```SQL
'
UNION
SELECT TABLE_NAME,COLUMN_NAME,NULL,NULL,NULL
FROM INFORMATION_SCHEMA.COLUMNS --
```
* This pulls back a list of tables along with the columns they contain.
* Here we can see that there is a column called
`employee_employment_number`.


* We now know that we need to select from the `Employee` table.
* We need the columns `employee_employment_number`, and `employee_name` to see
which number matches who.
```SQL
'
UNION
SELECT employee_employment_number,employee_name,NULL,NULL,NULL
FROM Employee --
```
* We now have everything we need to access Daffy's evaluation.


## Oh no!

* We got kicked out because we aren't HR.
* Don't forget that you must edit the Group parameter like before each time you submit the form.



## Congratulations!

You beat the Sitting Duck!



# Bonus Questions

Anyone that has completed a bonus challenge is free to present how they did
it.



# Questions?
