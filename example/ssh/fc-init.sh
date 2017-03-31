#!/bin/ash

PASSWD=$(echo $RANDOM$RANDOM | head -c 4)
echo "Setting Root Password: $PASSWD"
echo -e root:$PASSWD | chpasswd

touch /var/log/sshd.log
/usr/sbin/sshd -E /var/log/sshd.log
tail -f /var/log/sshd.log
