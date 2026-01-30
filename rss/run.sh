#!/bin/bash
set -ex

APP_DIR=/app
mkdir -p "$APP_DIR" /src
rm -f "$APP_DIR/.ready"

if ! id ttrss; then
    addgroup -g 8080 ttrss
    adduser -D -H -h "$APP_DIR" -g ttrss -u 8080 -G ttrss ttrss
fi

if [ -d "/src/.git" ]; then
	cd "/src" \
    && git pull origin main
else
	mkdir -p "/src" \
	&& git clone "https://github.com/tt-rss/tt-rss.git/" "/src" \
    && cd /src \
	&& git config core.filemode false
fi

rsync -avr --delete \
		--exclude /cache \
		--exclude /feed-icons \
		--exclude /lock \
		--exclude /config.php \
		--exclude .git \
		/src/ "$APP_DIR/"

if [ -f "$APP_DIR/config.php" ]; then
    ls -ld /app/config.php
    sha256sum /app/config.php
fi

for x in cache cache/images cache/upload cache/export feed-icons lock; do
    mkdir -p "$APP_DIR/$x"
    chmod 777 "$APP_DIR/$x"
    find "$APP_DIR/$x" -type f -exec chmod 666 {} \;
done

touch "$APP_DIR/.ready"
/usr/sbin/php-fpm84 --nodaemonize
