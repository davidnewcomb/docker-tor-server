#!/bin/bash

sed "s/#ServerName www.example.com/ServerName $(hostname)/" /etc/apache2/sites-available/000-default.conf > ~/tmp_apache
mv ~/tmp_apache /etc/apache2/sites-available/000-default.conf

service mysql start
service tor start
echo "======================================"
echo "            Tag: ${DOCKER_TAG}"
echo "  Onion address: $(cat /var/lib/tor/onion_service/hostname)"
echo "  Instance name: $(hostname)"
echo "           Date: $(date)"
echo "======================================"
mysql -uroot -pmysql < /dts/prep_db.sql
apache2ctl -D FOREGROUND

