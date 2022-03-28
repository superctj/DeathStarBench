#!/bin/bash
# Author: Luke Hobieka
# Description: flushes all memcache instances in the deathstart benchmark suit
# Usage : flushRedis.sh containerId1 containerId2 ... containerIdN
# Requirements : netcat is installed
# TODO: take ports in as arguements


# script: ./wrk -D exp -t 10 -c 100 -d 90s -L 
# -s ./scripts/social-network/compose-post.lua http://localhost:8080/wrk2-api/post/compose -R 5000
function cleanup {
    kill $!
}

trap cleanup EXIT
trap cleanup SIGINT

echo "" > "test.txt"

for i in {1..100}
do
    ./wrk2/wrk -D fixed -t 1 -c 1 -d 30s -L -s ./wrk2/scripts/social-network/compose-post.lua http://localhost:8080/wrk2-api/post/compose -R "$i"  >> "test.txt"
done 

