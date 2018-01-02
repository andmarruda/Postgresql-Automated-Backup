#!/bin/bash

hostname="localhost"
port=5432
username="postgres"
filepath="/var/pg_automacao/backup"
filebasename="backup"
database="db1"
backup_number_keep=5

find $filepath/*.backup -type f -mtime +$backup_number_keep -exec rm -v {} \;

/usr/lib/postgresql/10/bin/pg_dump --host "$hostname" --port "$port" --username $username --no-password --format tar --blobs --verbose --no-owner --file "$filepath/$filebasename-$(/bin/date "+%d-%m-%Y").backup" "$database"
