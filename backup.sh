#/!/bin/env bash

set -ex

backup_path="${HOME}/.backup"
mkdir -p "${backup_path}"
fname="${backup_path}/ttrss-$(date +%Y.%m.%d).gz"

docker exec -i ttrss-docker_postgres_1 pg_dump -U ttrss | gzip > "${fname}"

if [ $? -eq 0 ]; then
    echo "succsess"
else
    echo "failure"
fi
