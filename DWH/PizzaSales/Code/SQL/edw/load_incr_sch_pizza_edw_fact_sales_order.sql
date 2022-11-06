
delete from sch_pizza_edw.fact_sales_order where dt_insert = '2022-10-28';

insert into sch_pizza_edw.fact_sales_order(sales_order_sk, order_sk, product_sk, store_sk, date_id, time_id,
        product_price, quantity, rec_source, dt_insert)
select row_number() over (order by 2) + max_sk.sales_order_sk as sales_order_sk,
       dos.order_sk, dp.product_sk,
       ds.store_sk,dd.date_id,dt.time_id,
       dp.product_price,
       dos.quantity,
       'Shop-1' as rec_source ,current_date as dt_insert
    from
        sch_pizza_edw.dim_orders dos
    inner join sch_pizza_edw.dim_product dp on dp.product_id = dos.product_id
    inner join sch_pizza_edw.dim_store ds on ds.store_id = dos.rec_source
    inner join sch_pizza_edw.dim_date dd on dd.date = dos.date
    inner join sch_pizza_edw.dim_time dt on dt.timeofday = cast(dos.time as varchar(10))
    cross join (select coalesce(max(sales_order_sk),0) as sales_order_sk from sch_pizza_edw.fact_sales_order)max_sk
where dos.dt_insert = '2022-10-28';