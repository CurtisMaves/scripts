#!/bin/sh
date >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
echo $1 >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
echo $2 >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
echo "novpn.sh" >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
if [ `echo $1 | grep -c tun` != 0 ]; then
	echo  >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
	if [ `iptables -t mangle -L OUTPUT | grep -c 'owner GID match novpn MARK'` = 0 ]; then
		iptables -t mangle -A OUTPUT -m owner --gid-owner novpn -j MARK --set-mark 1
		iptables -t mangle -A OUTPUT -p tcp --sport 22 -j MARK --set-mark 0x1
	fi

	if [ `iptables -t nat -L POSTROUTING | grep -c 'mark match 0x1'` = 0 ]; then
		iptables -t nat -A POSTROUTING -m mark --mark 0x1 -j MASQUERADE
	fi

	if [ `ip rule | grep -c 'lookup novpn'` = 0 ]; then
		ip rule add fwmark 0x1 table novpn
	fi
	exit
fi

if [ "$2" = "down" ]; then
	ip route del dev $1 table novpn >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
	echo  >> /etc/NetworkManager/dispatcher.d/output.txt 2>&1
	exit
fi

ip route show table main | grep $1 | while read line; do
	ip route add $line table novpn
done
