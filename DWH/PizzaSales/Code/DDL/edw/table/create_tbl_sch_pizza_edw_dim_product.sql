drop table if exists sch_pizza_edw.dim_product;

create table sch_pizza_edw.dim_product
(
        product_sk integer primary key not null,
        product_id varchar (100),
        product_type_id varchar(100),
        product_name varchar (100),
        product_category varchar (100),
        product_family varchar(100),
        product_ingredients varchar (1000),
        product_size varchar (5),
        product_price decimal (5,2),
        rec_source varchar (10),
        dt_insert date,
        dt_update date
);