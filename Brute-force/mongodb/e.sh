#!/bin/bash

FLAG=$(env | grep FLAG | sed "s/.*=//g")
echo "Flag is: "$FLAG | tee /var/lib/ftp/README.xtx

function random_pass() {
    head -n $(shuf -i 1-1008 -n1) /unix_passwords.txt | tail -1
}

p=`random_pass`
echo "####"
echo "PASSWORD="$p
echo "####"

mongod --nojournal --smallfiles --logpath=/dev/null --fork --quiet

USER=admin
DATABASE=admin
PASS=$p

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for MongoDB service startup"
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

echo "=> Setting password"
mongo admin --eval \
	"db.createUser({user: '$USER', pwd: '$PASS', roles:[{role:'root',db:'admin'}]});"

echo "=> Setting flag"
mongo admin -u $USER -p $PASS --eval \
	"db.flag.insertOne({\"_id\":\"$FLAG\"}); db.flag.find()"

mongod --shutdown

echo "=> All is done."
mongod --nojournal --smallfiles --auth --maxConns 50 --quiet --logpath=/dev/null