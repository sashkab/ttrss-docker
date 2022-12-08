#!/bin/bash
set -ex

APP_DIR=/app

if ! id ttrss; then
    addgroup -g 8080 ttrss
    adduser -D -H -h "$APP_DIR" -g ttrss -u 8080 -G ttrss ttrss
fi

while [ ! -e "$APP_DIR/.ready" ]; do
    echo "waiting for app container..."
    sleep 5;
done

cd "$APP_DIR"
sudo -E -u ttrss /usr/bin/php81 ./update.php --update-schema=force-yes
sudo -E -u ttrss /usr/bin/php81 ./update_daemon2.php
