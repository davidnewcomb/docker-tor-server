#!/bin/bash

docker ps | grep "davidnewcomb/docker-tor-server" | awk '{print $1}' > IMAGE_ID 
if [ ! -s IMAGE_ID ]
then
	rm -f IMAGE_ID
fi
