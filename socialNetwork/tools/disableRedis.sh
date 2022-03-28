#!/bin/bash
# Author: Luke Hobieka
# Description: flushes all memcache instances in the deathstart benchmark suit
# Usage : disableRedis.sh containerId1 containerId2 ... containerIdN
# Requirements : netcat is installed
# TODO: take ports in as arguements

function cleanup {
    echo "Redis enabled"
}

trap cleanup EXIT

for var in "$@"
do
    docker exec -it $var redis-cli config set stop-writes-on-bgsave-error no
done

while true
do
    sleep .1
    for var in "$@"
    do
        docker exec -it $var redis-cli FLUSHALL
    done
done