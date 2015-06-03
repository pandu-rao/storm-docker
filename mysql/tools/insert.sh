#!/bin/bash

feature_file="feature.csv";
model_feature_file="model_feature.csv";

if [ -f "$feature_file" ]; then
    echo "Found $feature_file"
else
    echo "Unable to find $feature_file Did you run mkf.py?";
    exit -1;
fi

if [ -f "$model_feature_file" ]; then
    echo "Found $model_feature_file"
else
    echo "Unable to find $model_feature_file Did you run mkmf.py?";
    exit -1;
fi

echo "";

. ./vars.sh

sql=$(cat <<EOF
use operations;

insert into model (name, description) values ('name-1', 'description-1');

load data local infile '$feature_file' into table feature;
load data local infile '$model_feature_file' into table model_feature;

EOF
)

echo $sql | mysql -v -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" --password="$DB_PASS" --local-infile
