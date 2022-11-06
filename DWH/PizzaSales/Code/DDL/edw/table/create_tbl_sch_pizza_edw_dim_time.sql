drop table if exists sch_pizza_edw.dim_time;

create table sch_pizza_edw.dim_time
(
    time_id     bigint not null primary key,
    timeofday   varchar(10),
    quarterhour varchar(20),
    daytimename varchar(20),
    daynight    varchar(20)
);