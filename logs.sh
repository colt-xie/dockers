#!/bin/bash
name=$1
if [ -z "$1" ]; then
    echo "usage $0 [container-name]"
    echo "example: $0 php"
    exit
fi
container_id=`docker ps -aql -f "name=$name"`
if [ ! -z "$container_id" ]; then
    docker logs $container_id
else
    echo "container is not running!"
fi
