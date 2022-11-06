drop table if exists sch_pizza_stg.stg_pizzas_types;

create table sch_pizza_stg.stg_pizza_types(
    pizza_type_id varchar(100) primary key not null,
    name varchar(100) not null,
    category varchar(100) not null,
    ingredients varchar(1000) not null
);
