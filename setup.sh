#!/bin/bash
set -e

docker exec -i ttrssdocker_ttrss_1 cat /app/schema/ttrss_schema_pgsql.sql  |   docker exec -i ttrssdocker_postgres_1  psql -U ttrss ttrss
