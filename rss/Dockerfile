FROM alpine:3.12

LABEL \
    description="tt-rss: web-based news feed aggregator." \
    maintainer="github@compuix.com" \
    version="2020.11.22"

RUN set -xe \
    && apk add --no-cache bash curl rsync sudo ca-certificates postgresql-client \
        php7-json \
        php7-xml \
        php7-mbstring \
        php7-curl \
        php7-posix \
        php7-gd \
        php7-session \
        php7-mcrypt \
        php7-openssl \
        php7-dom \
        php7-common \
        php7-pgsql \
        php7-iconv \
        php7-pcntl \
        php7-zlib \
        php7-fileinfo \
        php7-intl \
        php7-fpm \
        php7-pdo \
        php7-pdo_pgsql \
        php7

ADD php-fpm.conf /etc/php7/php-fpm.conf
ADD run.sh /usr/bin/run.sh
ADD update.sh /usr/bin/update.sh

VOLUME /app

CMD [ "/usr/bin/run.sh" ]
