#!/bin/bash
set -ex

if ! id ttrss; then
    addgroup -g 8080 ttrss
    adduser -D -H -h /app -g ttrss -u 8080 -G ttrss ttrss
fi

APP_DIR=/app
mkdir -p "$APP_DIR" /src
rm -f "$APP_DIR/.ready"

curl -o - https://git.tt-rss.org/git/tt-rss/archive/master.tar.gz | tar -xz -C /src/ --strip-components=1

rsync -avr --delete \
		--exclude cache \
		--exclude feed-icons \
		--exclude lock \
		/src/ "$APP_DIR/"

for x in cache feed-icons lock; do
    mkdir -p "$APP_DIR/$x"
    chmod 777 "$APP_DIR/$x"
    find "$APP_DIR/$x" -type f -exec chmod 666 {} \;
done

touch "$APP_DIR/.ready"
/usr/sbin/php-fpm7 --nodaemonize
