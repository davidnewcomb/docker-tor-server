FROM ubuntu:latest

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	mariadb-server \
	mariadb-client \
	apache2 \
	apache2-utils \
	php \
	php-mysql \
	libapache2-mod-php \
	php-cli

#RUN apt-get clean 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	tor \
	curl

RUN mkdir /var/lib/tor/onion_service
# && chown debian-tor:debian-tor /var/lib/tor/onion_service


COPY dts /dts
RUN chmod -R +x /dts
RUN cp /dts/torrc /etc/tor/torrc
RUN cp /dts/info.php /var/www/html/info.php

EXPOSE 80

ENTRYPOINT ["/dts/run_stuff.sh"]

