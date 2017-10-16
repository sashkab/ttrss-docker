FROM alpine:3.6

LABEL description="tt-rss: web-based news feed aggregator."
LABEL maintainer="github@compuix.com"

RUN set -xe \
    && apk add --no-cache bash postfix git supervisor ca-certificates \
        php7-json \
        php7-xmlreader \
        php7-xmlwriter \
        php7-xmlrpc \
        php7-xml \
        php7-simplexml \
        php7-mbstring \
        php7-curl \
        php7-posix \
        php7-gd \
        php7-session \
        php7-mcrypt \
        php7-soap \
        php7-openssl \
        php7-gmp \
        php7-pdo_odbc \
        php7-dom \
        php7-pdo \
        php7-zip \
        php7-mysqli \
        php7-sqlite3 \
        php7-pdo_pgsql \
        php7-bcmath \
        php7-odbc \
        php7-pdo_mysql \
        php7-pdo_sqlite \
        php7-gettext \
        php7-bz2 \
        php7-iconv \
        php7-pdo_dblib \
        php7-ctype \
        php7-pcntl \
        php7-phar \
        php7-opcache \
        php7-zlib \
        php7-fileinfo \
        php7-tokenizer \
        php7-fpm \
        php7    

COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 9000/tcp

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
