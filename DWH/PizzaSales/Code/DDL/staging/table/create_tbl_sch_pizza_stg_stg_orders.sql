drop table if exists sch_pizza_stg.stg_orders;

create table sch_pizza_stg.stg_orders(
    order_id integer primary key not null,
    date date not null,
    time time not null
);