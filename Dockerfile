FROM php:8.1.0-apache
RUN apt-get update && apt-get -y install vim && apt-get -y install git && apt-get -y install iputils-ping && apt-get install -y cron && apt-get install -y libpng-dev && apt-get install -y libzip-dev && apt-get install -y zip && apt-get install -y sudo && apt-get install -y wget && apt-get install -y zsh
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-install zip
RUN docker-php-ext-enable zip
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd calendar
# composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# terminal colors with xterm
ENV TERM xterm
# set the zsh theme
ENV ZSH_THEME agnoster
# run the installation script
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN a2enmod rewrite
