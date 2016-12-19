#!/bin/sh

mkdir -vp /tmp/$SUDO_USER/gitcopy
chmod -v 700 /tmp/$SUDO_USER/gitcopy

cp -rvf /home/$SUDO_USER/scripts/* /tmp/$SUDO_USER/gitcopy 


#replace insert********** with your relavant info
chmod -v 700 /tmp/$SUDO_USER/gitcopy/vpn-up.sh
sed -i 's/dUser=<-username->/dUass=insertUserHere/' /tmp/$SUDO_USER/gitcopy/vpn-up.sh
sed -i 's/dPass=<-password->/dPass=insertPasswordHere/' /tmp/$SUDO_USER/gitcopy/vpn-up.sh

cp -vf /tmp/$SUDO_USER/gitcopy/vpn-up.sh /etc/NetworkManager/dispatcher.d/
cp -vf /tmp/$SUDO_USER/gitcopy/novpn.sh /etc/NetworkManager/dispatcher.d/
chmod -v u+x /etc/NetworkManager/dispatcher.d/*
chmod -v a-x /etc/NetworkManager/dispatcher.d/output.txt

rm -rvf /tmp/$SUDO_USER/gitcopy

