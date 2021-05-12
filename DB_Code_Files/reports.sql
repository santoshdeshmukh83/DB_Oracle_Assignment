CREATE OR REPLACE VIEW VW_MOST_SOLD_ITEMS_IN_A_WEEK
AS
SELECT prd.product_name, cntry.country_name, MAX(ot.quantity) AS sold_qty
FROM order_items ot, 
	 orders ord,
	 products prd, 
	 warehouses wh, 
	 locations loc, 
	 countries cntry
WHERE ord.order_id = ot.order_id
AND prd.product_id = ot.product_id
AND wh.warehouse_id = ot.warehouse_id
AND wh.location_id = loc.location_id
AND cntry.country_id = loc.country_id
AND TRUNC(ord.order_date) BETWEEN SYSDATE-7 AND SYSDATE
GROUP BY prd.product_name,cntry.country_name
ORDER BY 3 DESC ;


CREATE OR REPLACE VIEW VW_CUST_PLACED_MAX_ORDRS_IN_A_WEEK
AS
SELECT * FROM(
SELECT customer_name,country_name, 
ROW_NUMBER() OVER (PARTITION BY country_name ORDER BY country_name DESC) AS row_num
FROM(
SELECT cust.customer_name, cntry.country_name, COUNT(1) as tot_ord_cnt
FROM orders ord,
     customers cust,
	 warehouses wh, 
	 locations loc, 
	 order_items ot,
	 countries cntry
WHERE ord.customers_id = cust.customers_id
AND wh.warehouse_id = ot.warehouse_id
AND wh.location_id = loc.location_id
AND cntry.country_id = loc.country_id
AND ord.order_id = ot.order_id
AND ord.status <> 'Canceled'
GROUP BY cust.customer_name,cntry.country_name
)
) WHERE row_num =1;