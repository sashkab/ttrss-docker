FROM postgres:9.6-alpine

LABEL description="postgresql database for the tt-rss."
LABEL maintainer="github@compuix.com"

ADD init_sql.sh /docker-entrypoint-initdb.d/
COPY postgresql.conf /var/lib/postgresql/data/postgresql.conf
