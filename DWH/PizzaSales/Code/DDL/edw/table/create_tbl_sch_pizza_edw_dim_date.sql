drop table if exists sch_pizza_edw.dim_date;

create table sch_pizza_edw.dim_date
(
    date_id      bigint not null primary key,
    date         date,
    year         smallint,
    month        smallint,
    monthname    varchar(20),
    day          smallint,
    dayofyear    smallint,
    weekdayname  varchar(20),
    calendarweek smallint,
    quartal      varchar(5),
    weekend      varchar(20),
    is_holiday   varchar(3),
    period       varchar(30)
);