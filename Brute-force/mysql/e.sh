#!/bin/sh

# remove skip-grant-tables to allow password
sed -i "s/skip-grant-tables//" /etc/my.cnf

FLAG=$(env | grep FLAG | sed "s/.*=//g")
echo $FLAG

# 19950101 788889600
# 19950102 788976000
# 19960101 820425600
function random_day() {
    shuf -i 1-365 -n1
}
day=86400
d=$(random_day)
N=$((788889600 + $d * day))
PASSWD=$(date --date=@$N +%Y%m%d)

echo "Setting mysql password: $PASSWD"

mysqld &

sleep 3

mysql -D mysql <<EOF
CREATE USER 'root'@'%' IDENTIFIED BY "$PASSWD";
GRANT ALL ON *.* TO 'root'@'%' ;
FLUSH PRIVILEGES;
EOF

mysql <<EOF
CREATE DATABASE flag;
USE flag;
CREATE TABLE flag(flag text);
INSERT INTO flag VALUE("$FLAG");
EOF

# e...
pkill mysql

mysqld