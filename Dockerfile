FROM ubuntu:14.04

MAINTAINER Rizha Musthafa <rizha.musthafa@acommerce.asia>

ENV DEBIAN_FRONTEND noninteractive

# Update repository
RUN apt-get update

# Enable UTF-8 support
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Install software properties dependency
RUN apt-get install -y software-properties-common python-software-properties curl

# Patch nginx-1.8, php-5.6 repository and update
RUN add-apt-repository ppa:nginx/stable -y
RUN add-apt-repository ppa:ondrej/php5-5.6 -y
RUN apt-get update

# Install nginx
RUN apt-get -y install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Install PHP and dependency
RUN apt-get install -y php5-fpm nginx php5-mongo php5-sqlite php5-mcrypt php5-gd php5-sqlite php5-curl php5-xdebug

# Configure nginx
WORKDIR /etc/nginx/sites-enabled
ADD nginx/sites-available/default /etc/nginx/sites-available/default
ADD nginx/conf.d/php-fpm /etc/nginx/conf.d/php-fpm
RUN echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php

# Add nginx conf for elevenia channel
ADD nginx/sites-available/elevenia /etc/nginx/sites-available/elevenia
RUN ln -s ../sites-available/elevenia .

# Set default dir
WORKDIR /root

# Configure xdebug php extension
RUN echo "xdebug.remote_enable=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini

# MongoDB 3.0
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN mkdir -p /data/db/mongodb
RUN mkdir -p /var/log/mongodb
ADD mongo/mongod.conf /etc
 
# Clean up
RUN apt-get clean && apt-get autoclean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 27017

CMD service php5-fpm start \
	&& mongod -f /etc/mongod.conf \
	&& nginx