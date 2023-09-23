#!/bin/bash

DOCKER_TAG="${DOCKER_TAG:-davidnewcomb/docker-tor-server}"
HTML_DIR="${HTML_DIR:-${PWD}/fs/html}"

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

if [ "$FIRST" = "1" ]
then
	IMAGE_ID=$( docker run \
		$DETACH \
		--rm \
		-p 127.0.0.1:9001:80 \
		-v $HOME/tmp:/tmp \
		-v $PWD/fs/onion_service:/var/lib/tor/onion_service \
		-v $HTML_DIR:/var/www/html \
		"$DOCKER_TAG" )
else
	IMAGE_ID=$( docker run \
		$DETACH \
		--rm \
		-p 127.0.0.1:9001:80 \
		-v $HOME/tmp:/tmp \
		-v $HTML_DIR:/var/www/html \
		"$DOCKER_TAG" )
fi

echo $IMAGE_ID > IMAGE_ID
echo "IMAGE_ID=$IMAGE_ID"

if [ "$FIRST" = "1" ]
then
	echo "Copying onion_service folder for reuse"
	sleep 2
	docker cp -a $IMGE_ID:/var/lib/tor/onion_service fs/onion_service
	./kill.sh
fi

