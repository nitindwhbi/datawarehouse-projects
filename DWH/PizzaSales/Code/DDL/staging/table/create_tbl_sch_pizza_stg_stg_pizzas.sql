drop table if exists sch_pizza_stg.stg_pizzas;

create table sch_pizza_stg.stg_pizzas(
    pizza_id varchar(100) primary key not null,
    pizza_type_id varchar(100) not null,
    size varchar(5) not null,
    price decimal(5,2) not null
);
