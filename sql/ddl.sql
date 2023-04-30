drop table if exists member CASCADE;
create table member(
    id varchar(50) primary key,
    name varchar(50) not null,
    password varchar(50) not null,
    email varchar(50) not null
);

drop table if exists metabolism CASCADE;
create table metabolism(
    mid varchar(20) primary key,
    age varchar(10) not null,
    height varchar(10) not null,
    weight varchar(10) not null,
    gender varchar(10) not null,
    activity varchar(10) not null,
    basal_metabolic_rate varchar(10) not null,
    activity_metabolism varchar(10) not null
    );


)