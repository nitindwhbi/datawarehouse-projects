
delete from sch_pizza_stg.stg_order_details;

copy sch_pizza_stg.stg_order_details
from '/Users/nitin/Documents/Projects/DWH/Data/PizzaPlaceSales/pizza_sales/incremental/2022-01-01/order_details.csv'
delimiter '|' csv header;