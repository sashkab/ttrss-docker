FROM alpine:3.24.1

LABEL \
    maintainer="github@compuix.com" \
    version="2026.06.19" \
    description="tt-rss: web-based news feed aggregator."

RUN set -xe \
    && apk add --no-cache bash git curl rsync sudo ca-certificates postgresql-client \
    php85-phar \
    php85-xmlwriter \
    php85-simplexml \
    php85-tokenizer \
    php85-ctype \
    php85-zip \
    php85-exif \
    php85-xml \
    php85-mbstring \
    php85-curl \
    php85-posix \
    php85-gd \
    php85-session \
    php85-openssl \
    php85-dom \
    php85-common \
    php85-pgsql \
    php85-iconv \
    php85-pcntl \
    php85-zlib \
    php85-fileinfo \
    php85-intl \
    php85-fpm \
    php85-pdo \
    php85-pdo_pgsql \
    php85 \
    icu-data-full \
    && wget -q -P /usr/local/share/ca-certificates/ https://cacerts.digicert.com/ThawteRSACA2018.crt.pem \
    && wget -q -P /usr/local/share/ca-certificates/ https://cacerts.digicert.com/ThawteTLSRSACAG1.crt.pem \
    && ln -sfn php85 /usr/bin/php

ADD php-fpm.conf /etc/php85/php-fpm.conf
ADD run.sh /usr/bin/run.sh
ADD update.sh /usr/bin/update.sh
ADD ssl/SectigoECCDomainValidationSecureServerCA.crt.pem /usr/local/share/ca-certificates/SectigoECCDomainValidationSecureServerCA.crt.pem
ADD ssl/SectigoR36.pem /usr/local/share/ca-certificates/SectigoR36.pem
ADD ssl/SectigoR46.pem /usr/local/share/ca-certificates/SectigoR46.pem

RUN update-ca-certificates

VOLUME /app

CMD [ "/usr/bin/run.sh" ]
