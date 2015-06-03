#!/bin/bash

#
# get the address of the dockerized mysql server
#

name=$1

# get the container id
name_id=$(docker ps | grep $name | awk '{print $1}')

# inspect the container for its ip address
docker inspect $name_id | grep -i gateway | awk '{print $2}' | sed -e 's/[",]//g'
