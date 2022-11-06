delete from sch_pizza_edw.dim_orders
using sch_pizza_stg.stg_order_details
where dim_orders.order_details_id=stg_order_details.order_details_id;

insert into sch_pizza_edw.dim_orders(order_sk, order_id,order_details_id,product_id,quantity, date, time, rec_source, dt_insert)
select row_number() over (order by 1) + max_sk.order_sk as order_sk,
       so.order_id,
       sod.order_details_id,
       sod.pizza_id as product_id,
       sod.quantity ,
       so.date,
       so.time,
       'Shop-1' as rec_source,
       current_date as dt_insert
    from
        sch_pizza_stg.stg_orders so
inner join
        sch_pizza_stg.stg_order_details sod
on so.order_id = sod.order_id
cross join
        (select coalesce(max(order_sk),0) as order_sk from sch_pizza_edw.dim_orders)max_sk;
