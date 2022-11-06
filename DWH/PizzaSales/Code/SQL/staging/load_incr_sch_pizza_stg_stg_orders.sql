delete from sch_pizza_stg.stg_orders;

copy sch_pizza_stg.stg_orders
from '/Users/nitin/Documents/Projects/DWH/Data/PizzaPlaceSales/pizza_sales/incremental/2022-01-01/orders.csv'
delimiter '|' csv header;