# Network_Auto_Config
A series of bash shell scripts that run in the program. All of these script rely on the Network Manager's /etc/NetworkManager/dispatcher.d folder, to execute. <a href="http://linux.die.net/man/8/networkmanager">View this man page for more info about it</a>
##SSHFS smooth dismount
###[up_down.sh](up_down.sh)
When the network status changes an SSHFS share disconnects. This causes any program try to read the share or the parent directory of the share to go into an uninterruptible sleep, for 10-20 minutes while the SSHFS reconnects. This script lazy unmounts the share after a network change.

##Routing Traffic Outside VPN
###[novpn.sh](novpn.sh)
Sometimes, when connect to a VPN, it may be desirable to route specific traffic around the VPN and allow a direct connection (for speed, lower latency, or region dependent resources). This script creates a seperate routing table called "novpn" then routes specific traffic around. If iptables can differentate the traffic from other traffic, then this script should work to route traffic around, the vpn. It easy to custimize this script by editing which traffic iptables marks.
##Binding Deluge VPN IP address
###[vpn-up.sh](vpn-up.sh)
This command gets the IP address of the tun0 interface (VPN interface) and then sets the Deluge daemon to bind to that IP address. It then restarts the daemon. It also starts the syncthing daemon.

