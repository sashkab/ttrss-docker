FROM alpine:3.15.0

LABEL \
    description="tt-rss: web-based news feed aggregator." \
    maintainer="github@compuix.com" \
    version="2021.12.16"

RUN set -xe \
    && apk add --no-cache bash curl rsync sudo ca-certificates postgresql-client \
        php8-json \
        php8-xml \
        php8-mbstring \
        php8-curl \
        php8-posix \
        php8-gd \
        php8-session \
        php8-openssl \
        php8-dom \
        php8-common \
        php8-pgsql \
        php8-iconv \
        php8-pcntl \
        php8-zlib \
        php8-fileinfo \
        php8-intl \
        php8-fpm \
        php8-pdo \
        php8-pdo_pgsql \
        php8 \
    && ln -s /usr/bin/php8 /usr/bin/php

ADD php-fpm.conf /etc/php8/php-fpm.conf
ADD run.sh /usr/bin/run.sh
ADD update.sh /usr/bin/update.sh

VOLUME /app

CMD [ "/usr/bin/run.sh" ]
