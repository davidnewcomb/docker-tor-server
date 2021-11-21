#!/bin/bash

HOSTNAME_FILE="fs/onion_service/hostname"
if [ ! -f $HOSTNAME_FILE ]
then
	echo "error: can not fine $HOSTNAME_FILE, run ./run.sh"
	exit 1
fi
H=$(cat $HOSTNAME_FILE)

echo "Onion hostname : $H"
echo "Url            : http://$H"

