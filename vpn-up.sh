#!/bin/sh

dUser=<-username->
dPass=<-password->

date >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
echo $2 >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
if [ "$2" != "vpn-up" ]; then
	echo 'exit' >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
	exit
fi


sysctl -w net.ipv6.conf.all.disable_ipv6=1
systemctl status deluged || systemctl start deluged && sleep 2
systemctl start deluged >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
systemctl start syncthing@curtis.service >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1

IP_ADDR=$(ip addr show tun0 | grep -o -E 'inet [[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' | grep -o -E '[^inet ]{5}.*')

echo $IP_ADDR >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
deluge-console "connect localhost $dUser  $uPass; config --set listen_interface $IP_ADDR" >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
echo "connect localhost $dUser $uPass; config --set listen_address $IP_ADDR" >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1

systemctl restart deluged >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
