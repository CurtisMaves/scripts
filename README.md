# scripts
A series of bash shell scripts that help me automate parts of my day to day workflow and configure my network settings when changes occur


##Routing Traffic Outside VPN
###[novpn.sh](novpn.sh)
Sometimes, when connect to a VPN, it may be desirable to route specific traffic around the VPN and allow a direct connection (for speed, lower latency, or region dependent resources). This script creates a seperate routing table called "novpn" then routes specific traffic around. If iptables can differentate the traffic from other traffic, then this script should work to route traffic around, the vpn. It easy to custimize this script by editing which traffic iptables marks.
##Binding Deluge VPN IP address
###[vpn-up.sh](vpn-up.sh)
This command gets the IP address of the tun0 interface (VPN interface) and then sets the Deluge daemon to bind to that IP address. It then restarts the daemon. It also starts the syncthing daemon.

 All of these script rely on the Network Manager's /etc/NetworkManager/dispatcher.d folder, to execute. 
 <a href="http://linux.die.net/man/8/networkmanager">View this man page for more info about it</a>
