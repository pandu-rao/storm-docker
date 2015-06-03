#!/bin/bash

. ./vars.sh

mysql -v -h "$DB_HOST" -P "$DB_PORT" -u "$OPS_DB_USER" --password="$OPS_DB_PASS" "$OPS_DB_NAME"
