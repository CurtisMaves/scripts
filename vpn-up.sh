#!/bin/sh
#needs to be changed to match current deluge login credentials
dUser=<-username->
dPass=<-password->

date
echo $2
if [ "$2" != "vpn-up" ]; then
	echo 'exit' >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
	exit
fi


sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv4.conf.$1.rp_filter=0
sysctl -w net.ipv4.conf.default.rp_filter=0
sysctl -w net.ipv4.conf.all.rp_filter=0
systemctl start deluged
systemctl start syncthing@curtis.service

IP_ADDR=$(ip addr show tun0 | grep -o -E 'inet [[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' | grep -o -E '[^inet ]{5}.*')

echo $IP_ADDR
echo "connect localhost $dUser $dPass; config --set listen_address $IP_ADDR"
deluge-console "connect localhost $dUser  $dPass; config --set listen_interface $IP_ADDR"
