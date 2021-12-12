#!/bin/bash

HOSTNAME_FILE="fs/onion_service/hostname"
if [ ! -f $HOSTNAME_FILE ]
then
	echo "error: can not fine $HOSTNAME_FILE, run ./run.sh"
	exit 1
fi
H=$(cat $HOSTNAME_FILE)
CID=$(docker ps | grep "davidnewcomb/docker-tor-server" | grep -v CONTAINER | sed 's/ .*//')
if [ "$CID" = "" ]
then
	CID="No"
fi

echo "Onion hostname : $H"
echo "Url            : http://$H"
echo "Running        : $CID"

