#!/bin/bash
set -ex

if ! id ttrss; then
    addgroup -g 8080 ttrss
    adduser -D -H -h /app -g ttrss -u 8080 -G ttrss ttrss
fi

while [ ! -e /app/.ready ]; do
    echo "waiting for app container..."
    sleep 5;
done

sudo -u ttrss /usr/bin/php7 /app/update_daemon2.php
