drop table if exists sch_pizza_stg.stg_order_details;

create table sch_pizza_stg.stg_order_details(
    order_details_id integer primary key not null,
    order_id integer not null,
    pizza_id varchar(100),
    quantity smallint
);

