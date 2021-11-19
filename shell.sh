#!/bin/bash

if [ ! -f IMAGE_ID ]
then
	echo "No IMAGE_ID"
        exit 1
fi

IMAGE_ID=$(cat IMAGE_ID)
docker exec -it "$IMAGE_ID" /bin/bash
