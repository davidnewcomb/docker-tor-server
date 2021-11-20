# docker-tor-server
Tor LAMP server running in docker. Serving pages on the Onion network in seconds!

# Prerequisite

* [Docker](https://docs.docker.com/get-docker/)
* [docker-tor-browser](https://github.com/DomiStyle/docker-tor-browser) or another Tor browser

# Getting started

1. Copy example pages into position: `cp fs/html.example/* fs/html`
1. Install docker: `./build.sh`
1. Run container: `./run.sh`
1. Read your onion hostname: `cat fs/onion_service/hostname`
1. Load you Tor browser and go to:
* http://your_new_onion_address/info.php - PHP Info page
* http://your_new_onion_address/heros.php - Example MariaDB page
* http://your_new_onion_address/curl_test.php - Example of using PHP curl

