#!/bin/bash

# turn globbing off for *.*
set -f;

. ./vars.sh

sql=$(cat <<EOF
drop database if exists operations;
grant usage on *.* to 'mongoose'@'%' identified by 'password';
drop user 'mongoose'@'%';
EOF
)

echo $sql | mysql -v -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" --password="$DB_PASS"
