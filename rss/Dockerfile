FROM alpine:3.20.3

LABEL \
    maintainer="github@compuix.com" \
    version="2024.11.17" \
    description="tt-rss: web-based news feed aggregator."

RUN set -xe \
    && apk add --no-cache bash git curl rsync sudo ca-certificates postgresql-client \
    php82-phar \
    php82-xmlwriter \
    php82-simplexml \
    php82-tokenizer \
    php82-ctype \
    php82-zip \
    php82-exif \
    php82-json \
    php82-xml \
    php82-mbstring \
    php82-curl \
    php82-posix \
    php82-gd \
    php82-session \
    php82-openssl \
    php82-dom \
    php82-common \
    php82-pgsql \
    php82-iconv \
    php82-pcntl \
    php82-zlib \
    php82-fileinfo \
    php82-intl \
    php82-fpm \
    php82-pdo \
    php82-pdo_pgsql \
    php82 \
    icu-data-full \
    && wget -q -P /usr/local/share/ca-certificates/ https://cacerts.digicert.com/ThawteRSACA2018.crt.pem \
    && wget -q -P /usr/local/share/ca-certificates/ https://cacerts.digicert.com/ThawteTLSRSACAG1.crt.pem \
    && ln -sfn php82 /usr/bin/php

ADD php-fpm.conf /etc/php82/php-fpm.conf
ADD run.sh /usr/bin/run.sh
ADD update.sh /usr/bin/update.sh
ADD ssl/SectigoECCDomainValidationSecureServerCA.crt.pem /usr/local/share/ca-certificates/SectigoECCDomainValidationSecureServerCA.crt.pem

RUN update-ca-certificates

VOLUME /app

CMD [ "/usr/bin/run.sh" ]
