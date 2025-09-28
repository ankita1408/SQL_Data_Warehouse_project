--------------------------------------------------
------------crm_cust_info_table--------------------
----------------------------------------------------
--check for null or duplicates in primary key
--expected: no result
SELECT cst_id,count(*) FROM silver.crm_cust_info
group by cst_id having count(*)>1 or cst_id is null;

--check for unwanted spaces
--expect:no result
select cst_key
from silver.crm_cust_info
where cst_key !=trim(cst_key);
--firstname
select cst_firstname
from silver.crm_cust_info
where cst_firstname !=trim(cst_firstname);
--lastname
select cst_lastname
from silver.crm_cust_info
where cst_lastname !=trim(cst_lastname);

--data standardization & consistency
--marital status
select distinct cst_marital_status
from silver.crm_cust_info;
--gndr
select distinct cst_gndr
from silver.crm_cust_info;

select * from silver.crm_cust_info;


-------------------------------------------------------------
-----------
---exctract specific part of a string value


select 
prd_id,prd_key,
replace(SUBSTRING(prd_key,1,5),'-','_')as cat_id,--for joining with another table
SUBSTRING(prd_key,7,len(prd_key))as prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
from bronze.crm_prd_info
where SUBSTRING(prd_key,7,len(prd_key)) in
(select sls_prd_key
from silver.crm_sales_details);

--check unwanted spaces
--expectation no result
select prd_nm
from silver.crm_prd_info
where prd_nm!=trim(prd_nm);
--check null and negative numbers
--expectation no result
select prd_cost
from silver.crm_prd_info
where prd_cost<0 or prd_cost is null;


--data standardization & consistency
--change the names and fill na
select distinct prd_line
from silver.crm_prd_info;


--check for invalid date order
--no result
select prd_id,prd_key,prd_nm,prd_start_dt,prd_end_dt
from silver.crm_prd_info
where prd_end_dt<prd_start_dt;

select * from silver.crm_prd_info;



---------------------------------------
-------------------sales details
--------------------------------------------------
select * from silver.crm_sales_details;



---check unwanted space in sls_ord_num
select 
sls_ord_num,
sls_prd_key,
sls_cust_id,
sls_order_dt,
sls_ship_dt,
sls_due_dt,
sls_sales,
sls_quantity,
sls_price
from bronze.crm_sales_details;
--where sls_ord_num<>trim(sls_ord_num)
--where sls_prd_key not in(select prd_key from silver.crm_prd_info)
--where sls_cust_ke not in(select cst_id from silver.crm_cust_info)

---converting date format
--order_dt
select nullif(sls_order_dt,0) sls_order_dt
from silver.crm_sales_details
where sls_order_dt <=0 or len(sls_order_dt)!=8 or len(sls_order_dt)>8;
--ship_dt
select nullif(sls_ship_dt,0) sls_ship_dt
from silver.crm_sales_details
where sls_ship_dt <=0 or len(sls_ship_dt)!=8 or len(sls_ship_dt)>8;
---due_dt
select nullif(sls_due_dt,0) sls_due_dt
from silver.crm_sales_details
where sls_due_dt <=0 or len(sls_due_dt)!=8 or len(sls_due_dt)>8;



----checking for invalid date order
--for order
--no result
select * from silver.crm_sales_details
where sls_order_dt>sls_ship_dt or sls_order_dt>sls_due_dt;

/*business rule
sales=quantity*price
no(negative,zeros,null)*/
--result :no
select sls_sales as old_sls_sales,sls_quantity,sls_price as old_sls_price,
case when sls_sales is null or sls_sales<=0 or sls_sales!=sls_quantity*abs(sls_price)
then sls_quantity*abs(sls_price) else sls_sales end as sls_sales,
case when sls_price is null or sls_price<=0 
then sls_sales/nullif(sls_quantity,0) else sls_price end as sls_price
from silver.crm_sales_details
where sls_sales!=sls_quantity*sls_price 
or sls_sales is null or sls_price is null or sls_quantity is null
or sls_sales<=0 or sls_price<=0 or sls_quantity<=0;



------------------------------------------------------------------------
------------------erp_cust_az12-----------------------------------------
----------------------------------------------------------------------
----checking the relation with key 
select
cid,
case when cid like 'NAS%' then SUBSTRING(cid,4,len(cid))
else cid end cid,
bdate,
gen from silver.erp_cust_az12


---identify out of range date
---result: no
select distinct bdate 
from silver.erp_cust_az12
where  bdate>getdate();

---data standardization & consistency
--result : same both
select distinct gen,
case when upper(trim(gen)) in('F','FEMALE')then 'Female'
when upper(trim(gen)) in('M','MALE')then 'Male'
else 'n/a' end as gen
from silver.erp_cust_az12;

select * from silver.erp_cust_az12;

----------------------------------------------------------------------
------------------------erp_loc_a101
---------------------------------------------------------------
select 
cid,
cntry
from silver.erp_loc_a101;


---- check key is replace 
--result : no
select replace(cid,'-','') cid from 
silver.erp_loc_a101 
where replace(cid,'-','') not in
(select cst_key from silver.crm_cust_info);


-----data standardization & consistency
--result 2 column same 
select 
distinct cntry,
case when trim(cntry)='DE' then 'Germany'
when trim(cntry) in('US','USA') then 'United States'
when trim(cntry)='' or cntry is null then 'n/a'
else trim(cntry) end as cntry
from silver.erp_loc_a101;


------------------------------------------------------------------
-----------erp_px_cat_g1v2------------------------------------------
--------------------------------------------------------------------------

select * from silver.erp_px_cat_g1v2;



----unwanted spaces
--result no

select *
from silver.erp_px_cat_g1v2
where cat!=trim(cat) 
or subcat!=trim(subcat )
or maintenance!=TRIM(maintenance);


-- check data standardization
-- result : no
select distinct cat from silver.erp_px_cat_g1v2;

select distinct subcat from silver.erp_px_cat_g1v2;

select distinct maintenance from silver.erp_px_cat_g1v2;



EXEC Silver.load_silver;
exec broze.load_silver;




