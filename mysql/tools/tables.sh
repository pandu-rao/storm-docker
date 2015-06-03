#!/bin/bash

. ./vars.sh

sql=$(cat <<EOF
use operations;


create table model (
    id int(10) unsigned not null auto_increment,

    name varchar(32) not null,
    description varchar(255) not null,

    primary key (id) using btree
);

create table feature (
    id int(10) unsigned not null auto_increment,
    model_id int(10) unsigned not null,

    key_ varchar(64) not null,
    value_ varchar(64) not null,
    type_ varchar(16) not null,
    index_ int(10) unsigned not null,

    primary key (id) using btree,

    constraint fk_feature_model_id foreign key (model_id) references model (id)
);

create table  model_feature (
    id int(10) unsigned not null auto_increment,

    item_id int(10) unsigned not null,

    model_id int(10) unsigned not null,
    feature_id int(10) unsigned not null,

    created_at date not null,
    created_by varchar(10) not null,

    primary key (id) using btree,
    unique key uk_model_feature (item_id, model_id, feature_id),

    constraint fk_model_feature_model_id foreign key (model_id) references model (id),

    constraint fk_model_feature_feature_id foreign key (feature_id) references feature (id)
);
EOF
)

echo $sql | mysql -v -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" --password="$DB_PASS"
