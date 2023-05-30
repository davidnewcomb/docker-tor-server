#!/bin/bash

if [ ! -f IMAGE_ID ]
then
	echo "No image id"
	exit 1
fi

if [ "$1" = "" ]
then
	echo "usage: tails.sh [-a] [-e] [-t]"
	exit 1
fi

FILES=()
while [ "$1" != "" ]
do
	case "$1" in
		-a)
			FILES+=('/var/log/apache2/access.log')
			;;
		-e)
			FILES+=('/var/log/apache2/error.log')
			;;
		-t)
			FILES+=('/var/log/tor/notices.log')
			;;
		*)
			echo "Bad option '$1', -e|-a"
			exit 1
			;;
	esac
	shift
done

if [ "${#FILES[@]}" = "0" ]
then
	FILES+=('/var/log/apache2/error.log')
fi

IMAGE_ID=$(cat IMAGE_ID)
docker exec -it "$IMAGE_ID" tail -f "${FILES[@]}"
