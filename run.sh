#!/bin/bash

if [ -f IMAGE_ID ]
then
	echo "Probably already running"
	exit 1
fi

DETACH="-d"
if [ "$1" != "" ]
then
	DETACH=""
fi

if [ -z "$HTML_DIR" ]
then
	HTML_DIR="$PWD/fs/html"
fi

IMAGE_ID=$( docker run \
		$DETACH \
		--env="USER_NAME=$(whoami)" \
		--env="USER_UID=$(id -u)" \
		--env="USER_GID=$(id -g)" \
		--env="USER_HOME=/home/$(whoami)" \
		-p 127.0.0.1:9001:80 \
		-v $HOME/tmp:/tmp \
		-v $PWD/fs/onion_service:/var/lib/tor/onion_service \
		-v $HTML_DIR:/var/www/html \
		davidnewcomb/docker-tor-server )
echo $IMAGE_ID > IMAGE_ID
echo "IMAGE_ID=$IMAGE_ID"
