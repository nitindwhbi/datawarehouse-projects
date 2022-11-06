

delete from sch_pizza_stg.stg_pizzas;

copy sch_pizza_stg.stg_pizzas
from '/Users/nitin/Documents/Projects/DWH/Data/PizzaPlaceSales/pizza_sales/incremental/2022-01-01/pizzas.csv'
delimiter '|' csv header;
