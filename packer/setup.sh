#!/bin/bash


# Install web server and PHP
yum install httpd php php-fpm -y

# Health check
echo "test" > /var/www/html/health.html

# Start and enable services

cp -r /tmp/website/* /var/www/html
chown apache:apache -R /var/www/html
rm -rf /tmp/website

systemctl enable httpd php-fpm
systemctl start httpd php-fpm

