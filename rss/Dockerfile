FROM alpine:3.6

LABEL description="tt-rss: web-based news feed aggregator."
LABEL maintainer="github@compuix.com"

RUN set -xe \
    && apk add --no-cache bash supervisor ca-certificates \
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
        php7 \
    && addgroup -g 8080 ttrss && adduser -D -H -h /app -g ttrss -u 8080 -G ttrss ttrss

ADD php-fpm.conf /etc/php7/php-fpm.conf
ADD www.conf /etc/php7/php-fpm.d/www.conf
ADD supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 9000/tcp

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
