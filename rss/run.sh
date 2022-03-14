#!/bin/bash
set -ex

APP_DIR=/app
mkdir -p "$APP_DIR" /src
rm -f "$APP_DIR/.ready"

if ! id ttrss; then
    addgroup -g 8080 ttrss
    adduser -D -H -h "$APP_DIR" -g ttrss -u 8080 -G ttrss ttrss
fi

if [ -d "$APP_DIR/.git" ]; then
	cd "$APP_DIR" \
    && git pull origin master
else
	mkdir -p "$APP_DIR" \
	&& git clone "https://git.tt-rss.org/fox/tt-rss.git" "$APP_DIR" \
    && cd $APP_DIR \
	&& git config core.filemode false
fi

for x in cache cache/images cache/upload cache/export feed-icons lock; do
    mkdir -p "$APP_DIR/$x"
    chmod 777 "$APP_DIR/$x"
    find "$APP_DIR/$x" -type f -exec chmod 666 {} \;
done

touch "$APP_DIR/.ready"
/usr/sbin/php-fpm8 --nodaemonize
