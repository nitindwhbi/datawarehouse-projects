drop table if exists sch_pizza_edw.dim_store;

create Table sch_pizza_edw.dim_store
(
        store_sk integer primary key not null,
        store_id varchar (100),
        store_name varchar (100),
        store_zip varchar (100),
        store_city varchar (100),
        store_staff smallint,
        rec_source varchar (10),
        dt_insert date
);