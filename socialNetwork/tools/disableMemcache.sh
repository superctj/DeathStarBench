#!/bin/bash
# Author: Luke Hobieka
# Description: flushes all memcache instances in the deathstart benchmark suit
# Usage : disableMemcache.sh port1 port2 ... port n
# Requirements : netcat is installed
# TODO: take ports in as arguements

function cleanup {
    echo "Memcache enabled"
}

trap cleanup EXIT


while true
do
    for var in "$@"
        do
        echo 'flush_all' | nc localhost $var
    done
    sleep .1
done


