drop table if exists sch_pizza_edw.fact_sales_order;

create table sch_pizza_edw.fact_sales_order
(
        sales_order_sk integer primary key not null,
        order_sk integer,
        product_sk integer,
        store_sk integer,
        date_id bigint,
        time_id bigint,
        product_price decimal (5,2),
        quantity smallint,
        rec_source varchar (10),
        dt_insert date
);