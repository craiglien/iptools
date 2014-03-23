# iptools
=======

These are tools I use to look through log files and routing tables.

## ipsort 
ipsort will find all the lines in a file that contain an IP address and
print the lines sorted by ip address.

Here is a simple example of sorting the arp table on my system.

$ arp -an | ./ipsort.pl
? (172.16.143.1) at 00:00:xx:yy:zz:01 [ether] on eth0
? (172.16.143.2) at 00:00:xx:yy:zz:02 [ether] on eth0
? (172.16.143.254) at 00:00:xx:yy:zz:03 [ether] on eth0

## ipgrep
ipgrep matches using a colon-delimited list of addresses or networks.  

Here is a simple example of searching interfaces on my system.

$ ifconfig -a | ./ipgrep.pl 172.16/16:127.0.0.1
          inet addr:172.16.143.138  Bcast:172.16.143.255  Mask:255.255.255.0
          inet addr:127.0.0.1  Mask:255.0.0.0