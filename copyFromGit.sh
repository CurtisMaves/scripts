#!/bin/sh

mkdir -p /tmp/$SUDO_USER/gitcopy
chmod 700 /tmp/$SUDO_USER/gitcopy

cp -rf /home/$SUDO_USER/scripts/* /tmp/$SUDO_USER/gitcopy 


#replace insert********** with your relavant info
chmod 700 /tmp/$SUDO_USER/gitcopy/vpn-up.sh
sed -i 's/\dUser=<-username->/\dUass=insertUserHere/' /tmp/$SUDO_USER/gitcopy/vpn-up.sh
sed -i 's/\dPass=<-password->/\dPass=insertPasswordHere/'/tmp/$SUDO_USER/gitcopy/vpn-up.sh

cp -f /tmp/$SUDO_USER/gitcopy/vpn-up.sh /etc/NetworkManager/dispatcher.d/
cp -f /tmp/$SUDO_USER/gitcopy/nopvn.sh /etc/NetworkManager/dispatcher.d/
chmod u+x /etc/NetworkManager/dispatcher.d/*
chmod a-x /etc/NetworkManager/dispatcher.d/output.txt

rm -rf /tmp/$SUDO_USER/gitcopy

