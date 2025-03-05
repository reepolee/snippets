# shouldn't let in anyone from outside 
iptables -A INPUT -i eth0 -p tcp --dport 22 ! -s 192.168.0.0/24 -j DROP