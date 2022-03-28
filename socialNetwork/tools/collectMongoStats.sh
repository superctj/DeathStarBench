#!/bin/bash
# Author: Luke Hobieka
# Description: collects all information from the mongodb instances and outputs the information to files 
# Usage : collectMongoStats.sh
# Requirements : mognodb isntances are running
# TODO: take ports in as arguements

# Notes found online

# After starting each child process, you can get its id with
# ID=$!ƒ

fileSuffix="_output.text"
uniqueName=$1

function cleanup {
    for var in "$@"
    do
        docker cp "/" + $var + $fileSuffix  "/" + $uniqueName + "/" + $var + $fileSuffix
        docker exec $var -d rm "/" + $var + $fileSuffix
    done
}

trap cleanup EXIT

for var in "$@"
do
    if ["$uniqueName" = "$var"]; then
        continue
    fi
    docker exec $var -d mongostat > "/" + $var + $fileSuffix
done


while true
do
    sleep 1000
done
