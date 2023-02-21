drop table if exists member CASCADE;
create table member(
    id varchar(50) primary key,
    name varchar(50) not null,
    password varchar(50) not null,
    email varchar(50) not null
);