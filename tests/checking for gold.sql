

select distinct
ci.cst_gndr,
ca.gen,
case when ci.cst_gndr !='n/a' then ci.cst_gndr
else coalesce(ca.gen,'n/a') end  new_gen,
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key=ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key=la.cid


---check the  no null or duplicates of gender 
select distinct gender from gold.dim_customers;




-------------------------

---check  the duplicates
select prd_key, count(*) from(
select 
pn.prd_id,
pn.cat_id,
pn.prd_key,
pn.prd_nm,
pn.prd_cost,
pn.prd_line,
pn.prd_start_dt,
pc.cat,
pc.subcat,
pc.maintenance
from silver.crm_prd_info pn
left join silver.erp_px_cat_g1v2 pc
on pn.cat_id=pc.id
where pn.prd_end_dt is null)t group by prd_key
having count(*)>1;


select * from gold.dim_products;



select * from gold.fact_sales;



----forieign key integrity

select * from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
left join gold.dim_products p
on p.product_key = f.product_key
where p.product_key is null