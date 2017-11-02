FROM php:7.0-cli
MAINTAINER Jonas Renggli <jonas.renggli@visol.ch>

RUN apt-get update \
    && apt-get install -y \
        git \
        wget \
        unzip \
        rsync \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --filename=composer --install-dir=/usr/bin

RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "hirak/prestissimo"

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update \
    && apt-get install -y yarn \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g grunt-cli bower

RUN apt-get update \
    && apt-get install -y \
        ruby \
        ruby-dev \
    && rm -rf /var/lib/apt/lists/*

RUN gem install compass
