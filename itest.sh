#!/bin/bash
cd "$( cd "$( dirname "$0" )" && pwd )"
#apt-get update && apt-get -y install sudo $1

$1 ./script-under-itest.py &
P=$!
./py-bt $P
kill $P
