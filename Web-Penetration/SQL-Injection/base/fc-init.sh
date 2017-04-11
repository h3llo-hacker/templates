#!/bin/sh

# Turn on php error track
sed -i "s/track_errors\ =\ Off/track_errors\ =\ On/g" /etc/php7/php.ini

mysqld &> /dev/null &

echo 
echo "Replace Flag String..."
cd /app
FLAG=$(env | grep FLAG | sed "s/.*=//g")
sed -i "s/FLAG/${FLAG}/g" data.sql

echo 
echo "Running Server..."

php7 -S 0.0.0.0:80 &> /dev/null