#!/bin/bash

# turn globbing off for operations.*
set -f;

. ./vars.sh

sql=$(cat <<EOF
create database operations;
create user 'mongoose'@'%' identified by 'password';
grant all privileges on operations.* to 'mongoose'@'%';
EOF
)

echo $sql | mysql -v -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" --password="$DB_PASS"
