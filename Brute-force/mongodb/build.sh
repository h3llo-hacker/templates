#!/bin/bash
docker build -t wrfly/brute_force-mongodb:latest .

docker run --rm -ti -p 27117:27017 -e FLAG=flag{hello} wrfly/brute_force-mongodb:latest