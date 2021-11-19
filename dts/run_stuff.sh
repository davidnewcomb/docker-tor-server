#!/bin/bash

USER_NAME=${USER_NAME:-davidnewcomb}
USER_UID=${USER_UID:-501}
USER_GID=${USER_GID:-20}
USER_HOME=${USER_HOME:-/home/"${USER_NAME}"}
USER_PASSWD=${USER_PASSWD:-"$(openssl passwd -1 -salt "$(openssl rand -base64 6)" "${USER_NAME}")"}

echo "  USER_NAME=$USER_NAME"
echo "   USER_UID=$USER_UID"
echo "   USER_GID=$USER_GID"
echo "  USER_HOME=$USER_HOME"
echo "USER_PASSWD=$USER_PASSWD"

! grep -q ":${USER_GID}:$" /etc/group && groupadd --gid "${USER_GID}" "${USER_NAME}"
useradd --shell /bin/bash --uid "${USER_UID}" --gid "${USER_GID}" --password "${USER_PASSWD}" --home-dir "${USER_HOME}" --create-home "${USER_NAME}"

sed "s/^User debian-tor$/User ${USER_NAME}/" /usr/share/tor/tor-service-defaults-torrc > ~/tmp_torrc
mv ~/tmp_torrc /usr/share/tor/tor-service-defaults-torrc

sed "s/#ServerName www.example.com/ServerName $(hostname)/" /etc/apache2/sites-available/000-default.conf > ~/tmp_apache
mv ~/tmp_apache /etc/apache2/sites-available/000-default.conf

mkdir -p /run/tor
chown $USER_UID:$USER_GID /var/lib/tor/onion_service
chmod 700 /var/lib/tor/onion_service
chown $USER_UID:$USER_GID  /var/lib/tor
chown -R $USER_UID:$USER_GID /var/log/tor
chown -R $USER_UID:$USER_GID /run/tor

service mysql start
service tor start
echo "======================================"
echo "davidnewcomb/docker-tor-server:"
echo "  Onion address: $(cat /var/lib/tor/onion_service/hostname)"
echo "  Instance name: $(hostname)"
echo "           Date: $(date)"
echo "======================================"
mysql -uroot -pmysql < /dts/prep_db.sql
apache2ctl -D FOREGROUND

