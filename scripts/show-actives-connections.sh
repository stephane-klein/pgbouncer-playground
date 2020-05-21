#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker-compose exec postgres bash -c "psql -U \${POSTGRES_USER} \${POSTGRES_DB} -c 'SELECT usename, application_name, client_addr, ssl FROM pg_stat_ssl JOIN pg_stat_activity ON pg_stat_ssl.pid = pg_stat_activity.pid;'"