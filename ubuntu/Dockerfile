FROM ubuntu:22.04

LABEL maintainer "Igor Talevski <igor.talevski@internetbrands.com>"

EXPOSE 80

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update

# Install some tools

RUN apt-get -y install git
RUN apt-get -y install  mc
RUN apt-get -y install  wget
RUN apt-get -y install git
RUN apt-get -y install mc
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install vim
RUN apt-get -y install nano
RUN apt-get -y install ne
RUN apt-get -y install lynx
RUN apt-get -y install tar
RUN apt-get -y install bzip2
RUN apt-get -y install zip
RUN apt-get -y install unzip
RUN apt-get -y install cronolog

# Install apache
RUN apt-get -y install apache2

# Install PHP
RUN apt-get -y install php libapache2-mod-php php-mysql
RUN apt-get -y install php php-gd  php-pdo  php-mbstring  php-pear  php-mysqlnd  php-bcmath  php-cli

RUN apt-get -y install php-common
RUN apt-get -y install php-fpm
RUN apt-get -y install php-gmp
RUN apt-get -y install php-intl
RUN apt-get -y install php-json
RUN apt-get -y install php-pgsql
RUN apt-get -y install php-opcache
RUN apt-get -y install php-pear
RUN apt-get -y install php-pspell
RUN apt-get -y install php-xml
RUN apt-get -y install php-xdebug
RUN apt-get -y install php-soap
RUN apt-get -y install php-tidy
RUN apt-get -y install php-memcache
RUN apt-get -y install php-memcached
RUN apt-get -y install tidy
RUN apt-get -y install php-imagick
RUN apt-get -y install php-redis


# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer


# Install gitflow
RUN apt-get -y install git-flow

RUN apt-get install -y bash-completion

# Fix some permission issues
ARG HOST_UID

RUN mkdir -p /etc/httpd/logs

# RUN chown -R docker:$HOST_UID /etc/httpd/logs
# RUN chown -R docker:$HOST_UID /run/httpd
# RUN chown -R docker:$HOST_UID /etc/httpd
# RUN chown -R docker:$HOST_UID /var/log
# RUN chown -R docker:$HOST_UID /var/media
# RUN chown -R docker:$HOST_UID /run/php-fpm


RUN git clone https://github.com/mubaris/motivate.git
RUN mkdir -p /opt/motivate
RUN cp -r /motivate/motivate/data /opt/motivate/
RUN chmod -R 777 /opt/motivate/data
RUN cp /motivate/motivate/motivate.py /opt/motivate/
RUN ln -s /opt/motivate/motivate.py /usr/local/bin/motivate

RUN apt-get install -y supervisor
RUN mkdir -p /run/supervisor


# RUN apt-get install -y doas;

RUN apt-get install -y bash-completion

# RUN mkdir -p /etc/doas.d/
# RUN  adduser docker -G wheel; \
#         echo 'docker:docker' | chpasswd; \
#         echo 'permit nopass :wheel as root' > /etc/doas.d/doas.conf

RUN apt-get update && apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN chown -R docker:$HOST_UID /var/log

RUN chown -R docker:$HOST_UID /var/run/apache2/

RUN service apache2 start


RUN apt-get install -y php-curl
RUN apt-get install -y php-zip

RUN apt-get install -y netcat

RUN a2enmod rewrite

RUN apt-get install -y bsdmainutils
RUN apt-get install -y bsdextrautils
USER docker




# ENTRYPOINT ["/bin/sh", "-c" , "/usr/local/bin/entrypoint.sh && /usr/bin/supervisord && /usr/sbin/php-fpm && /usr/sbin/httpd -DFOREGROUND && cat /etc/motd "]
# ENTRYPOINT ["/bin/sh", "-c" , "/usr/local/bin/entrypoint.sh  && service apache2 start && tail -f /dev/null  "]
ENTRYPOINT ["/bin/sh", "-c" , "service apache2 start && tail -f /dev/null "]
