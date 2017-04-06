#!/bin/bash
echo -n "" > passwd.txt
day=86400
for (( i = 0; i < 365; i++ )); do
	N=$((788889600 + $i * day))
	PASSWD=$(date --date=@$N +%Y%m%d)
	echo $PASSWD >> passwd.txt
done