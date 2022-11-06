
delete from sch_pizza_stg.stg_pizza_types;

copy sch_pizza_stg.stg_pizza_types
from '/Users/nitin/Documents/Projects/DWH/Data/PizzaPlaceSales/pizza_sales/incremental/2022-01-01/pizza_types.csv'
delimiter '|' csv header;