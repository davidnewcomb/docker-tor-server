FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	mariadb-server \
	mariadb-client \
	apache2 \
	apache2-utils \
	php \
	php-mysql \
	libapache2-mod-php \
	php-cli \
	php-curl \
	tor \
	curl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	inetutils-ping \
	inetutils-telnet

RUN mkdir /var/lib/tor/onion_service


COPY dts /dts
RUN chmod -R +x /dts
RUN mv /dts/torrific-curl /bin/torrific-curl
RUN mv /dts/torrc /etc/tor/torrc

EXPOSE 80

ENTRYPOINT ["/dts/run_stuff.sh"]

