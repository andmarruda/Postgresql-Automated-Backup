#!/bin/bash

if [ "$#" -lt  "4" ]; then
        echo 'Please inform the necessary parameters to work.'
        echo ' 1: host'
        echo ' 2: port'
        echo ' 3: database'
        echo ' 4: username'
        exit 1
fi

backup_path="/var/pg_automacao_2/"
file_keep=5

host=$1
port=$2
database=$3
username=$4
pg_version=$(echo $(psql -p $port -V) | grep -Po "(?<=\(PostgreSQL\) )[0-9]{1,2}")

if [ ! -f /usr/lib/postgresql/$pg_version/bin/pg_dump ]; then
        echo 'We cannot locate pg_dump file.'
        exit 1
fi

find $filepath/*.backup -type f -mtime +$file_keep -exec rm -v {} \;
/usr/lib/postgresql/$pg_version/bin/pg_dump --host "$host" --port "$port" --username $username --no-password --format tar --blobs --verbose --no-owner --file "$backup_path/$database-$(/bin/date "+%d-%m-%Y").backup" "$database"
