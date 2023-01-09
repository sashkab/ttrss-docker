FROM alpine:3.17.1

LABEL \
    description="tt-rss: web-based news feed aggregator." \
    version="2023.01.09" \
    maintainer="github@compuix.com"

RUN set -xe \
    && apk add --no-cache bash git curl rsync sudo ca-certificates postgresql-client \
        php81-phar \
        php81-xmlwriter \
        php81-simplexml \
        php81-tokenizer \
        php81-ctype \
        php81-zip \
        php81-exif \
        php81-json \
        php81-xml \
        php81-mbstring \
        php81-curl \
        php81-posix \
        php81-gd \
        php81-session \
        php81-openssl \
        php81-dom \
        php81-common \
        php81-pgsql \
        php81-iconv \
        php81-pcntl \
        php81-zlib \
        php81-fileinfo \
        php81-intl \
        php81-fpm \
        php81-pdo \
        php81-pdo_pgsql \
        php81 \
        icu-data-full \
    && wget -q -P /usr/local/share/ca-certificates/ \
        https://cacerts.digicert.com/ThawteRSACA2018.crt.pem \
    && update-ca-certificates

ADD php-fpm.conf /etc/php81/php-fpm.conf
ADD run.sh /usr/bin/run.sh
ADD update.sh /usr/bin/update.sh

VOLUME /app

CMD [ "/usr/bin/run.sh" ]
