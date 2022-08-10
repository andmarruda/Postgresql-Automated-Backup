#!/bin/bash

backup_path="/var/pg_automacao_2/"
file_keep=5

host=$1
port=$2
database=$3
username=$4
pg_version=$5

find $filepath/*.backup -type f -mtime +$file_keep -exec rm -v {} \;

/usr/lib/postgresql/10/bin/pg_dump --host "$host" --port "$port" --username $username --no-password --format tar --blobs --verbose --no-owner --file "$backup_path/$database-$(/bin/date "+%Y-%m-%d").backup" "$database"
