# docker-tor-server
Tor LAMP server running in docker. Serving pages on the Onion network in seconds!


# Prerequisite

* [Docker](https://docs.docker.com/get-docker/)
* [docker-tor-browser](https://github.com/DomiStyle/docker-tor-browser) or another Tor browser


# Getting started

1. Copy example pages into position: `cp fs/html.example/* fs/html`
1. Create docker image: `./build.sh`
1. Run container: `./run.sh`
1. Read your onion hostname: `cat fs/onion_service/hostname`
1. Load you Tor browser and go to:
* http://your_new_onion_address/info.php - PHP Info page
* http://your_new_onion_address/heros.php - Example MariaDB page
* http://your_new_onion_address/curl_test.php - Example of using PHP curl


# Support utils

`run.sh` puts the docker image id into a file called `IMAGE_ID` which is used by
the other programs in the system.

* `shell.sh` - Open a shell on running image
* `kill.sh` - Kill docker image
* `reset.sh` - Sometimes the IMAGE_ID gets out of sync, so refresh it
* `hostname.sh` - Details of onion host
* `tails.sh` - tail-f on error (-e default) or access logs (-a)


# Platform utils
* `/bin/torrific-curl` - cURL that speaks SOCKS5 on port 9050 (torrific-curl "http://remote.onion" [output_file])

