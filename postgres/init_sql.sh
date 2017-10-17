#!/bin/bash
set -e

echo "Initializing ttrss database..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" < /tmp/ttrss_schema_pgsql.sql
