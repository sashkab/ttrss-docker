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
    && git pull origin master
else
	mkdir -p "/src" \
	&& git clone "https://git.tt-rss.org/fox/tt-rss.git" "/src" \
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

for x in cache cache/images cache/upload cache/export feed-icons lock; do
    mkdir -p "$APP_DIR/$x"
    chmod 777 "$APP_DIR/$x"
    find "$APP_DIR/$x" -type f -exec chmod 666 {} \;
done

ln -sfn /usr/bin/php82 /usr/bin/php

touch "$APP_DIR/.ready"
/usr/sbin/php-fpm82 --nodaemonize
