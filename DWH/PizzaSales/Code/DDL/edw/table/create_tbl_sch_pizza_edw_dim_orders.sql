drop table if exists sch_pizza_edw.dim_orders;

create table sch_pizza_edw.dim_orders
      (
    order_sk integer primary key not null,
    order_id integer,
    order_details_id integer,
    date date,
    time time,
    rec_source varchar(10),
    dt_insert date
);