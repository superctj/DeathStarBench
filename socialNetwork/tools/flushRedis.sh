#!/bin/bash
# Author: Luke Hobieka
# Description: flushes all memcache instances in the deathstart benchmark suit
# Usage : flushRedis.sh containerId1 containerId2 ... containerIdN
# Requirements : netcat is installed
# TODO: take ports in as arguements



for var in "$@"
do
    sleep .1
    docker exec -it $var redis-cli FLUSHALL
done