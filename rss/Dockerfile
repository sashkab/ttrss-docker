FROM alpine:3.23.3

LABEL \
    maintainer="github@compuix.com" \
    version="2026.01.28" \
    description="tt-rss: web-based news feed aggregator."

RUN set -xe \
    && apk add --no-cache bash git curl rsync sudo ca-certificates postgresql-client \
    php84-phar \
    php84-xmlwriter \
    php84-simplexml \
    php84-tokenizer \
    php84-ctype \
    php84-zip \
    php84-exif \
    php84-xml \
    php84-mbstring \
    php84-curl \
    php84-posix \
    php84-gd \
    php84-session \
    php84-openssl \
    php84-dom \
    php84-common \
    php84-pgsql \
    php84-iconv \
    php84-pcntl \
    php84-zlib \
    php84-fileinfo \
    php84-intl \
    php84-fpm \
    php84-pdo \
    php84-pdo_pgsql \
    php84 \
    icu-data-full \
    && wget -q -P /usr/local/share/ca-certificates/ https://cacerts.digicert.com/ThawteRSACA2018.crt.pem \
    && wget -q -P /usr/local/share/ca-certificates/ https://cacerts.digicert.com/ThawteTLSRSACAG1.crt.pem \
    && ln -sfn php84 /usr/bin/php

ADD php-fpm.conf /etc/php84/php-fpm.conf
ADD run.sh /usr/bin/run.sh
ADD update.sh /usr/bin/update.sh
ADD ssl/SectigoECCDomainValidationSecureServerCA.crt.pem /usr/local/share/ca-certificates/SectigoECCDomainValidationSecureServerCA.crt.pem
ADD ssl/SectigoR36.pem /usr/local/share/ca-certificates/SectigoR36.pem
ADD ssl/SectigoR46.pem /usr/local/share/ca-certificates/SectigoR46.pem

RUN update-ca-certificates

VOLUME /app

CMD [ "/usr/bin/run.sh" ]
