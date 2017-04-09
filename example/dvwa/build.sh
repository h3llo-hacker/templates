#!/bin/bash
docker build -t wrfly/example:dvwa .

[[ "$?" == "0" ]] || exit 1

echo
echo
echo
docker stack deploy -c docker-compose.yml dvwa
