
delete from sch_pizza_edw.dim_store;

insert into sch_pizza_edw.dim_store(store_sk, store_id, store_name, store_zip, store_city, store_staff, rec_source, dt_insert)
values (1,'Shop-1','Best Pizza','1234 AB','Paris',12,'Static',current_date);
