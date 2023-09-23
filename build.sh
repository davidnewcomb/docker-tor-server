#!/bin/bash
#

CLEAN=""
DOCKER_TAG="${DOCKER_TAG:-davidnewcomb/docker-tor-server}"

if [ "$1" = "clean" ]
then
	CLEAN="--no-cache"
fi

docker build $CLEAN --build-arg "DOCKER_TAG=$DOCKER_TAG" -t "$DOCKER_TAG" .

