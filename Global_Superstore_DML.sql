USE `Global_Superstore_Relational`;


INSERT INTO Global_Superstore_Relational.customer (    
    customer_first_name,
    customer_middle_name,
    customer_last_name,
    segment)
(SELECT 
    DISTINCT
    Customer_First_Name,
    Customer_Middle_Name,
    Customer_Last_Name,
    Segment
FROM
    global_superstore.import);


INSERT INTO Global_Superstore_Relational.product (    
	product_id,
	category,
	sub_category,
	product_name)
(SELECT 
    DISTINCT Product_ID,
    Category,
    Sub_Category,
    Product_Name 
FROM
    global_superstore.import);
    

INSERT INTO Global_Superstore_Relational.market (    
	market_name)
(SELECT 
    DISTINCT Market
FROM
    global_superstore.import);
    
    
INSERT INTO Global_Superstore_Relational.country (    
	country_name,
    market_id)
(SELECT 
    DISTINCT i.Country,
    m.market_id
FROM
    global_superstore.import i 
JOIN
	Global_Superstore_Relational.market m 
ON
	i.Market = m.market_name);
    
    
INSERT INTO Global_Superstore_Relational.state (    
	state_name,
    country_id)
(SELECT 
    DISTINCT i.State,
    c.country_id
FROM
    global_superstore.import i 
JOIN
	Global_Superstore_Relational.country c  
ON
	i.Country = c.country_name);

    
INSERT INTO Global_Superstore_Relational.address (    
	city_name,
	postal_code,
	state_id)
(SELECT 
    DISTINCT i.City,
    i.Postal_Code,
    s.state_id
FROM
    global_superstore.import i
JOIN
	Global_Superstore_Relational.state s 
ON
	i.State = s.state_name
);
    

INSERT INTO Global_Superstore_Relational.order (    
	order_id,
    order_date,
    ship_date,
    ship_mode,
    order_priority,
    customer_id,
    address_id)
(SELECT 
    DISTINCT i.Order_ID,
    i.Order_Date,
    i.Ship_Date,
    i.Ship_Mode,
    i.Order_Priority,
    c.customer_id,
    a.address_id
FROM
    global_superstore.import i 
JOIN
	Global_Superstore_Relational.address a  
ON
	i.City = a.city_name
    AND
    i.Postal_Code = a.postal_code
JOIN
	Global_Superstore_Relational.customer c 
USING
	(customer_first_name, customer_middle_name, customer_last_name)
);
    
    
INSERT INTO Global_Superstore_Relational.sales (    
	sales,
	quantity,
	discount,
	profit,
	shipping_cost,
	order_key,
	product_key)
(SELECT 
    DISTINCT i.Sales,
    i.Quantity,
    i.Discount,
    i.Profit,
	i.Shipping_Cost,
	o.order_key,
	p.product_key    
FROM
    global_superstore.import i 
JOIN
	Global_Superstore_Relational.order o 
USING
	(order_ID, order_date, ship_date, ship_mode,order_priority)
JOIN
	Global_Superstore_Relational.product p 
ON
	i.product_id = p.product_id
    AND
    i.product_name = p.product_name
    );







