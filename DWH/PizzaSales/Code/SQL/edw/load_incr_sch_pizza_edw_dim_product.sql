
update sch_pizza_edw.dim_product
    set product_price = stg_pizzas.price,
        dt_update = current_date
from sch_pizza_stg.stg_pizzas
where stg_pizzas.pizza_id = dim_product.product_id
and dim_product.product_price <> stg_pizzas.price;


insert into sch_pizza_edw.dim_product (product_sk, product_id,product_type_id, product_name, product_category, product_family,
                         product_ingredients, product_size, product_price, rec_source, dt_insert, dt_update)
select row_number() over (order by 1) + max_sk.product_sk ,
       sp.pizza_id as product_id,
       spt.pizza_type_id as product_type_id,
       spt.name as product_name,
       spt.category as product_category,
       'pizza' as product_family,
       spt.ingredients as product_ingredients,
       sp.size as product_size,
       sp.price as product_price,
       'Shop-1' as rec_source,
       current_date as dt_insert,
       NULL as dt_update
    from sch_pizza_stg.stg_pizzas sp
    inner join
        sch_pizza_stg.stg_pizza_types spt on sp.pizza_type_id = spt.pizza_type_id
    left join sch_pizza_edw.dim_product dp
        on dp.product_id = sp.pizza_id
    cross join
        (select coalesce(max(product_sk),0) as product_sk from sch_pizza_edw.dim_product)max_sk
    where dp.product_id is null ;
