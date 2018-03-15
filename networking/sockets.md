# Sockets

By: Nick Bulischeck

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!

<span style="padding-top: 6em; font-size: 0.4em; float: left;">Material: <a href="https://tldrlegal.com/license/creative-commons-attribution-sharealike-4.0-international-(cc-by-sa-4.0)">Creative Commons Attribution-ShareAlike 4.0</a></span><span style="padding-top: 6em; font-size: 0.4em; float: right;">Code: <a href="https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)">BSD 2-Clause</a></span>



## Clone Me!

```Bash
git clone https://github.com/nbulischeck/pcode.git
```



## What is a Socket?

* A way to speak to other programs using Unix fds
* "Everything is a file"


## Two Types of Sockets

* Stream - SOCK_STREAM
* Datagram - SOCK_DGRAM


### What Protocol Do I Use?

* Stream Sockets
* Datagram Sockets


### What Protocol Do I Use?

* Stream Sockets - TCP
* Datagram Sockets


### What Protocol Do I Use?

* Stream Sockets - TCP
* Datagram Sockets - UDP



## System Calls

* getaddrinfo
* socket
* bind
* connect
* listen
* accept
* send and recv
* sendto and recvfrom
* close
* getpeername and gethostname


### getaddrinfo

```C
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>

int getaddrinfo(const char *node,     // "www.example.com" or IP
                const char *service,  // "http" or port number
                const struct addrinfo *hints, // filled in prev
                struct addrinfo **res); // result stored here
```

```Bash
cat /etc/services
```


#### getaddrinfo

```C
int res;
struct addrinfo hints;
struct addrinfo *servinfo;

memset(&hints, 0, sizeof hints); // zero struct
hints.ai_family = AF_UNSPEC;     // IPv4 or IPv6
hints.ai_socktype = SOCK_STREAM; // TCP stream sockets
hints.ai_flags = AI_PASSIVE;     // fill in my IP for me

if ((res = getaddrinfo(NULL, "3490", &hints, &servinfo)) != 0){
    exit(1);
}

freeaddrinfo(servinfo); // free the linked-list
```


#### getaddrinfo

* AF_UNSPEC for IPv4 or IPv6
* **servinfo points to a linked list of addrinfos**
* free our servinfo with freeaddrinfo


### socket

It's time to make a socket!

```C
#include <sys/types.h>
#include <sys/socket.h>

int socket(int domain, int type, int protocol); 
```


#### socket

* domain - IPv4 or IPv6
* type - stream or datagram
* protocol - TCP or UDP


#### socket

```C
int sfd;
struct addrinfo hints, *si;
getaddrinfo("www.example.com", "http", &hints, &si);
sfd = socket(si->ai_family, si->ai_socktype, si->ai_protocol);
```


### bind

I request a port!

```
#include <sys/types.h>
#include <sys/socket.h>

int bind(int sockfd, struct sockaddr *my_addr, int addrlen);
```


#### bind

* sockfd - the socket file descriptor we made with `socket()`
* my_addr - port and ip address in a struct
* addrlen - length in bytes of the address


#### bind

```C
int sfd;
struct addrinfo hints, *si;

memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC;
hints.ai_socktype = SOCK_STREAM;
hints.ai_flags = AI_PASSIVE;

getaddrinfo(NULL, "3490", &hints, &res);
sfd = socket(si->ai_family, si->ai_socktype, si->ai_protocol);
bind(sockfd, si->ai_addr, si->ai_addrlen);
```


#### bind's savior - setsockopt

```C
int yes = 1;
setsockopt(sfd,SOL_SOCKET,SO_REUSEADDR,&yes,sizeof yes);
```


#### Note on Bind

* Bind is not necessary when connecting to remote boxes
* Only if you want to specify the port you're connecting on


### connect

```C
#include <sys/types.h>
#include <sys/socket.h>

int connect(int sfd, struct sockaddr *serv_addr, int addrlen); 
```


#### connect

* sfd - our socket file descriptor from `socket()`
* serv_addr - destination port and ip address in a struct
* length in bytes of the server address struct


#### connect

```C
int sfd;
struct addrinfo hints, *si;

memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC;
hints.ai_socktype = SOCK_STREAM;

getaddrinfo("www.example.com", "3490", &hints, &res);

sfd = socket(si->ai_family, si->ai_socktype, si->ai_protocol);

connect(sfd, si->ai_addr, si->ai_addrlen);
```


### listen

Is anyone out there?

```C
int listen(int sockfd, int backlog); 
```

* sockfd - our socket file descriptor from `socket()`
* backlog - number of connections allowed in the queue


### accept

Someone's trying to get in. Okay!

```C
#include <sys/types.h>
#include <sys/socket.h>

int accept(int sfd, struct sockaddr *addr, socklen_t *addrlen); 
```


#### accept

* sfd - our socket file descriptor from `socket()`
* addr - pointer to a local `struct sockaddr_storage`
* addrlen - `sizeof(struct sockaddr_storage)`


### All Together

```
getaddrinfo()
socket()
bind()
listen()
accept()
```


### Server Example

```C
int sfd, cfd;
struct addrinfo hints, *res;
struct sockaddr_storage c_addr;
socklen_t client_size = sizeof c_addr;

memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC;
hints.ai_socktype = SOCK_STREAM;
hints.ai_flags = AI_PASSIVE;

getaddrinfo(NULL, "4000", &hints, &si);
sfd = socket(si->ai_family, si->ai_socktype, si->ai_protocol);
bind(sfd, si->ai_addr, si->ai_addrlen);
listen(sfd, 10);
cfd = accept(sockfd, (struct sockaddr *)&c_addr, c_size);
```


### Client Example

```C
int sfd;
struct addrinfo hints, *res;

memset(&hints, 0, sizeof hints);
hints.ai_family = AF_UNSPEC;
hints.ai_socktype = SOCK_STREAM;
hints.ai_flags = AI_PASSIVE;

getaddrinfo("localhost", "4000", &hints, &si);
sfd = socket(si->ai_family, si->ai_socktype, si->ai_protocol);
connect(sfd, si->ai_addr, si->ai_addrlen);
```


### send and recv

```C
int send(int sfd, const void *msg, int len, int flags); 
int recv(int sfd, void *buf, int len, int flags);
```


### sendto and recvfrom

```C
int sendto(int sockfd, const void *msg, int len,
	unsigned int flags, const struct sockaddr *to,
	socklen_t tolen);
int recvfrom(int sockfd, void *buf, int len,
	unsigned int flags, struct sockaddr *from,
	int *fromlen); 
```


### close and shutdown

```C
int close(sockfd);
int shutdown(int sockfd, int how); 
```


#### shutdown

* 0 - Further receives are disallowed
* 1 - Further sends are disallowed
* 2 - Further sends and receives are disallowed (`close()`)


#### getpeername and gethostname

Who am I connected to?

```C
#include <sys/socket.h>
int getpeername(int sfd, struct sockaddr *addr, int *addrlen); 
```

Who am I?

```C
#include <unistd.h>
int gethostname(char *hostname, size_t size); 
```



## Demo



# Questions?
