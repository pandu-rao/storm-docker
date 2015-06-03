#!/bin/bash

action=${1:-restart}

. ./vars.sh

if [ "$action" == "create" ]; then
    docker run --name mysql-server -v `pwd`/../data:/var/lib/mysql -v `pwd`/..:/root -p "$DB_PORT":3306 -e MYSQL_ROOT_PASSWORD="$DB_PASS" -d mysql;
elif [ "$action" == "destroy" ]; then
    docker stop mysql-server && docker rm mysql-server;
elif [ "$action" == "start" ]; then
    docker start mysql-server && docker ps -l;
elif [ "$action" == "stop" ]; then
    docker stop mysql-server
elif [ "$action" == "restart" ]; then
    docker stop mysql-server && docker start mysql-server && docker ps -l;
else
    echo "Usage server.sh create|destroy|start|stop|restart";
fi
