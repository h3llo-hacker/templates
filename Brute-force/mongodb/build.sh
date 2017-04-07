#!/bin/bash
docker build -t wrfly/brute-force_mongodb:latest .

docker run --rm -ti -p 27117:27017 -e FLAG=flag{hello} wrfly/brute-force_mongodb:latest