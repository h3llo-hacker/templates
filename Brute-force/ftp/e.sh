#!/bin/sh

FLAG=$(env | grep FLAG | sed "s/.*=//g")
echo "Flag is: "$FLAG | tee /var/lib/ftp/README.xtx

function random_pass() {
    head -n $(shuf -i 1-100 -n1) /top100.txt | tail -1
}

p1=`random_pass`
p2=`random_pass`
echo "####"
echo ftp:$p1
echo ftp:$p1 | chpasswd
echo vsftp:$p2
echo vsftp:$p2 | chpasswd
echo "####"

echo ftp >> /etc/vsftpd.allowed_users
echo vsftp >> /etc/vsftpd.allowed_users

vsftpd