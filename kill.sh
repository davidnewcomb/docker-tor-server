#!/bin/bash

if [ ! -f IMAGE_ID ]
then
	exit 0
fi
IMAGE_ID=$(cat IMAGE_ID)
docker kill "$IMAGE_ID"
rm IMAGE_ID
