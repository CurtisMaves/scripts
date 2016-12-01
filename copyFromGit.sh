#!/bin/sh

mkdir -p /tmp/$USER/gitcopy
chmod 700 /tmp/$USER/gitcopy

cp -rf ~/scripts/* /tmp/$USER/gitcopy 


#replace insert********** with your relavant info
chmod 700 /tmp/$USER/gitcopy/vpn-up.sh
sed 's/\$dUser=<-username->/\$dPass=insertUserHere/' /tmp/$USER/gitcopy/vpn-up.sh
sed 's/\$dPass=<-password->/\$dPass=insertPasswordHere/'/tmp/$USER/gitcopy/vpn-up.sh

cp -f /tmp/$USER/gitcopy/vpn-up.sh /etc/NetworkManager/dispatcher.d/
cp -f /tmp/$USER/gitcopy/nopvn.sh /etc/NetworkManager/dispatcher.d/
cp -f /tmp/$USER/gitcopy/up_down.sh /etc/NetworkManager/dispatcher.d/
chmod u+x /etc/NetworkManager/dispatcher.d/*
chmod a-x /etc/NetworkManager/dispatcher.d/output.txt

rm -rvf /tmp/$USER/gitcopy

