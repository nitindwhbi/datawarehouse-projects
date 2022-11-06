drop table if exists sch_pizza_edw.dim_orders;

create table sch_pizza_edw.dim_orders
      (
    order_sk integer primary key not null,
    order_id integer,
    order_details_id integer,
    product_id varchar(100),
    quantity smallint,
    date date,
    time time,
    rec_source varchar(10),
    dt_insert date
);
