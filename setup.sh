#!/bin/bash
set -ex

while [ ! "$(docker container inspect -f '{{.State.Running}}' ttrssdocker_phpfpm_1)" == "true" ]; do
    echo "waiting for container to start..."
    sleep 5
done

docker exec -i ttrssdocker_phpfpm_1 bash -c "while [ ! -e /app/.ready ]; do echo waiting for app container...; sleep 5; done"
docker exec -i ttrssdocker_phpfpm_1 cat /app/schema/ttrss_schema_pgsql.sql  |   docker exec -i ttrssdocker_postgres_1  psql -U ttrss ttrss
