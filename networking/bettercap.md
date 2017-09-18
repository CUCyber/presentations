# Bettercap

By: Nick Bulischeck and Foster McLane

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# What is Bettercap?


## Man-In-The-Middle

* Someone is between you and the resources you're requesting

* They can see your traffic


## Man-In-The-Middle

![img](mitm.jpg)


## Why not Ettercap?

* Unstable on large networks (host discovery)

* Not easily extended unless you dev in C/C++

* Filters are outdated and don't always work

* No modular HTTP(S) and TCP transparent proxies

* No credential sniffer


## Dependencies

* Comes as a Ruby gem

* Ruby (>= 1.9)

* RubyGems environment

* Fully compatible with GNU/Linux, Mac OS X and OpenBSD platforms.


## Installation

Ubuntu

```Bash
sudo apt install build-essential ruby-dev libpcap-dev
gem install bettercap
```

Kali

```Bash
sudo apt update
sudo apt install bettercap
```

BlackArch

```Bash
sudo pacman -S bettercap
```


Usage: bettercap [options]

MAIN:

    -I, --interface IFACE            Network interface name - default: wlp3s0
        --use-mac ADDRESS            Change the interface MAC address to this value before performing the attack.
        --random-mac                 Change the interface MAC address to a random one before performing the attack.
    -G, --gateway ADDRESS            Manually specify the gateway address, if not specified the current gateway will be retrieved and used. 
    -T, --target ADDRESS1,ADDRESS2   Target IP addresses, if not specified the whole subnet will be targeted.
        --ignore ADDRESS1,ADDRESS2   Ignore these addresses if found while searching for targets.
        --no-discovery               Do not actively search for hosts, just use the current ARP cache, default to false.
        --no-target-nbns             Disable target NBNS hostname resolution.
        --packet-throttle NUMBER     Number of seconds ( can be a decimal number ) to wait between each packet to be sent.
        --check-updates              Will check if any update is available and then exit.
    -R, --rainbows                   Rainbow output, because that's a really helpful thing to have (requires the "lolize" gem to be installed).
    -h, --help                       Display the available options.

LOGGING:

    -O, --log LOG_FILE               Log all messages into a file, if not specified the log messages will be only print into the shell.
        --log-timestamp              Enable logging with timestamps for each line, disabled by default.
    -D, --debug                      Enable debug logging.
        --silent                     Suppress every message which is not an error or a warning, default to false.

SPOOFING:

    -S, --spoofer NAME               Spoofer module to use, available: NONE, NDP, ARP, ICMP, MAC, HSRP - default: ARP for IPv4 and NDP for IPv6.
        --no-spoofing                Disable spoofing, alias for --spoofer NONE.
        --full-duplex                Enable full-duplex MITM, this will make bettercap attack both the target(s) and the router.
        --kill                       Instead of forwarding packets, this switch will make targets connections to be killed.

SNIFFING:

    -X, --sniffer                    Enable sniffer.
    -L, --local                      Parse packets coming from/to the address of this computer ( NOTE: Will set -X to true ), default to false.
        --sniffer-source FILE        Load packets from the specified PCAP file instead of the interface ( will enable sniffer ).
        --sniffer-output FILE        Save all packets to the specified PCAP file ( will enable sniffer ).
        --sniffer-filter EXPRESSION  Configure the sniffer to use this BPF filter ( will enable sniffer ).
    -P, --parsers PARSERS            Comma separated list of packet parsers to enable, '*' for all ( NOTE: Will set -X to true ), available: DHCP, COOKIE, HTTPAUTH, MAIL, PGSQL, TEAMTALK, NTLMSS, DICT, ASTERISK, SNPP, WHATSAPP, MPD, TEAMVIEWER, HSRP, BFD, HTTPS, FTP, URL, RLOGIN, POST, SNMP, MYSQL, RADIUS, WOL, IRC, REDIS, NNTP - default: *
        --disable-parsers PARSERS    Comma separated list of packet parsers to disable ( NOTE: Will set -X to true )
        --custom-parser EXPRESSION   Use a custom regular expression in order to capture and show sniffed data ( NOTE: Will set -X to true ).

PROXYING:


  TCP:

        --tcp-proxy                  Enable TCP proxy ( requires other --tcp-proxy-* options to be specified ).
        --tcp-proxy-module MODULE    Ruby TCP proxy module to load.
        --tcp-proxy-port PORT        Set local TCP proxy port, default to 2222 .
        --tcp-proxy-upstream ADDRESS:PORT
                                     Set TCP proxy upstream server address and port.
        --tcp-proxy-upstream-address ADDRESS
                                     Set TCP proxy upstream server address.
        --tcp-proxy-upstream-port PORT
                                     Set TCP proxy upstream server port.

  UDP:

        --udp-proxy                  Enable UDP proxy ( requires other --udp-proxy-* options to be specified ).
        --udp-proxy-module MODULE    Ruby UDP proxy module to load.
        --udp-proxy-port PORT        Set local UDP proxy port, default to 3333 .
        --udp-proxy-upstream ADDRESS:PORT
                                     Set UDP proxy upstream server address and port.
        --udp-proxy-upstream-address ADDRESS
                                     Set UDP proxy upstream server address.
        --udp-proxy-upstream-port PORT
                                     Set UDP proxy upstream server port.
  HTTP:

        --proxy                      Enable HTTP proxy and redirects all HTTP requests to it, default to false.
        --proxy-port PORT            Set HTTP proxy port, default to 8080.
        --allow-local-connections    Allow direct connections to the proxy instance, default to false.
        --no-sslstrip                Disable SSLStrip.
        --log-http-response          Log HTTP responses.
        --no-http-logs               Suppress HTTP requests and responses logs.
        --proxy-module MODULE        Ruby proxy module to load, either a custom file or one of the following: injectjs, injectcss, redirect, injecthtml.
        --http-ports PORT1,PORT2     Comma separated list of HTTP ports to redirect to the proxy, default to 80.
        --proxy-upstream-address ADDRESS
                                     If set, only requests coming from this server address will be redirected to the HTTP/HTTPS proxies.

  HTTPS:

        --proxy-https                Enable HTTPS proxy and redirects all HTTPS requests to it, default to false.
        --proxy-https-port PORT      Set HTTPS proxy port, default to 8083.
        --proxy-pem FILE             Use a custom PEM CA certificate file for the HTTPS proxy, default to /root/.bettercap/bettercap-ca.pem .
        --https-ports PORT1,PORT2    Comma separated list of HTTPS ports to redirect to the proxy, default to 443.

  CUSTOM:

        --custom-proxy ADDRESS       Use a custom HTTP upstream proxy instead of the builtin one.
        --custom-proxy-port PORT     Specify a port for the custom HTTP upstream proxy, default to 8080.
        --custom-https-proxy ADDRESS Use a custom HTTPS upstream proxy instead of the builtin one.
        --custom-https-proxy-port PORT
                                     Specify a port for the custom HTTPS upstream proxy, default to 8083.
        --custom-redirection RULE    Apply a custom port redirection, the format of the rule is PROTOCOL ORIGINAL_PORT NEW_PORT. For instance TCP 21 2100 will redirect all TCP traffic going to port 21, to port 2100.

SERVERS:

        --httpd                      Enable HTTP server, default to false.
        --httpd-port PORT            Set HTTP server port, default to 8081.
        --httpd-path PATH            Set HTTP server path, default to ./ .
        --dns FILE                   Enable DNS server and use this file as a hosts resolution table.
        --dns-port PORT              Set DNS server port, default to 5300.


# For examples & docs please visit https://bettercap.org/


# Questions?



# Competitions
