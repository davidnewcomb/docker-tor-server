#!/bin/bash
#

CLEAN=""
if [ "$1" = "clean" ]
then
	CLEAN="--no-cache"
fi

docker build $CLEAN -t davidnewcomb/docker-tor-server .

