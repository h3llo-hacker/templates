#!/bin/bash
docker build -t wrfly/brute-force_ftp:latest .

docker run --rm -ti -p 22221:21 -e FLAG=flag{hello} wrfly/brute-force_ftp:latest