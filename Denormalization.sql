SELECT
	c.customer_id,
    c.customer_first_name,
    c.customer_last_name,
    o.order_key,
    o.order_date,
    o.order_priority,
    s.sales,
    s.quantity,
    s.discount,
    s.profit,
    s.shipping_cost,
    p.product_key,
    p.category,
    p.sub_category,
    p.product_name
    
FROM 
	customer c 
RIGHT JOIN
	orders o 
USING 
	(customer_id)
JOIN
	sales s 
USING
	(order_key)
JOIN
	product p 
USING
	(product_key)
    