#!/bin/bash
docker build -t wrfly/brute_force-ftp:latest .

docker run --rm -ti -p 22221:21 -e FLAG=flag{hello} wrfly/brute_force-ftp:latest