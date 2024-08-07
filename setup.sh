#!/bin/bash
set -ex

while [ ! "$(docker container inspect -f '{{.State.Running}}' ttrssdocker-phpfpm-1)" == "true" ]; do
    echo "waiting for container to start..."
    sleep 5
done

docker exec -i ttrssdocker-phpfpm-1 bash -c "while [ ! -e /app/.ready ]; do echo waiting for app container...; sleep 10; done"
docker exec -i ttrssdocker-phpfpm-1 bash -c "cd /app; sudo -E -u ttrss /usr/bin/php82 ./update.php --update-schema=force-yes"
