#!/bin/bash

docker ps | grep "davidnewcomb/docker-tor-server" | awk '{print $1}' > IMAGE_ID 
if [ ! -s IMAGE_ID ]
then
	echo "IMAGE_ID removed"
	rm -f IMAGE_ID
else
	echo "IMAGE_ID updated"
fi
