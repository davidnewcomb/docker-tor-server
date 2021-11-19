# docker-tor-server
Tor LAMP server running in docker. Serving pages on the Onion network in seconds!

# Getting started

1. Install docker: `./build.sh`
1. Copy example pages into position: `cp fs/html.example/* fs/html`
1. Run container: `./run.sh`
1. Read hostname: `cat fs/onion_service/hostname`
1. Go to test pages:
* http://example.onion/info.php
* http://example.onion/heros.php
