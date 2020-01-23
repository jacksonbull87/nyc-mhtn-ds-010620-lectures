SELECT c.city, COUNT(customer_id) AS '# of Customers' FROM sales.customers c
WHERE c.state = 'CA'
GROUP BY c.city
;

SELECT * FROM sales.customers;

SELECT c.city, COUNT(c.customer_id) FROM sales.customers c
WHERE c.state = 'CA'
GROUP BY c.city
HAVING COUNT(c.customer_id) > 10
;


SELECT 
s.staff_id,
s.first_namne,
s.last_name,
s.store_id,
COUNT(order_status)
FROM sales.staffs s
INNER JOIN sales.orders o
ON 
s.staff_id = o.staff_id
WHERE
s.staff_id = 3
GROUP BY 
s.first_name,
s.last_name;

SELECT order_id,
order_date,
customer_id
FROM sales.orders
WHERE customer_id IN (SELECT customer_id FROM sales.customers
WHERE city = 'New York'

)
ORDER BY order_date DESC;


SELECT 
	COUNT(product_id),
    product_name
FROM 
	production_products
WHERE 
	product_name LIKE 'Surly%'
GROUP BY
	product_name
ORDER BY
	COUNT(product_id) DESC;
    

SELECT 
	CASE order_status
		WHEN 1 THEN 'Pending'
        wHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
	END AS order_status_str,
    COUNT(order_id) AS order_count
FROM sales.orders
WHERE 
	YEAR(order_date) = 2018
GROUP BY order_status;


SELECT 
	SUM(CASE
		WHEN order_status = 1
        THEN 1
        ELSE 0
	END) AS 'Pending',
    SUM(CASE
		WHEN order_status = 1
        THEN 1
        ELSE 0
	END) AS 'Processing',
    SUM(CASE
		WHEN order_status = 2
        THEN 1
        ELSE 0
	END) AS 'Processing',
    SUM(CASE
		WHEN order_status = 3
        THEN 1
        ELSE 0
	END) AS 'Rejected',
    SUM(CASE
		WHEN order_status = 4
        THEN 1
        ELSE 0
	END) AS 'Completed',
    COUNT(*) AS total
FROM sales.orders
WHERE 
	YEAR(order_date) = 2018;
    
    
    
SELECT
 o.order_id,
 SUM(quanity * list_price) AS order_value)
 CASE
	WHEN SUM(quantity * list_price) <= 500
		THEN 'very low'
	WHEN SUM(quantity * list_price) > 500
		SUM(quantity * list_price) <= 1000
        THEN 'Low'
	WHEN SUM(quantity * list_price) > 1000 AND
		SUM(quantity * list_price) <= 5000
        THEN 'Medium'
	WHEN SUM(quantity * list_price) > 5000
		SUM(quantity * list_price) <= 10000
        THEN 'High'
	WHEN SUM(quantity * list_price) > 10000
        THEN 'Very High'
	END AS order_priority
FROM sales.orders o 
INNER JOIN sales.order_items i
ON o.order_id = i.order_id
WHERE 
	YEAR(o.order_date) = 2018
GROUP BY 
o.order_id;

(SELECT 
	product_id,
    product_name,
    list_price
FROM 
	production.products
WHERE
	list_price > 100)
UNION
(SELECT
	product_id,
    product_name,
    list_price
FROM 
	production.products
WHERE list_price < 300);

#Return the cities in California which has more than 10 customers.

SELECT c.city, COUNT(c.customer_id)


FROM sales.customers c
WHERE c.state = 'CA'
GROUP BY c.city
HAVING COUNT(c.customer_id) > 10;

#Use the GROUP BY clause to return distinct cities together with state and zip code from the sales.customers table.

SELECT c.city, c.state, c.zip_code FROM sales.customers c
GROUP BY c.city;

#Rewrite this query with the DISTINCT keyword.
SELECT DISTINCT(c.city), c.state, c.zip_code FROM sales.customers c
;

#Return the products whose list price is greater than 300 and model is 2018.
SELECT DISTINCT(p.product_name) FROM production.products p 
WHERE p.list_price > 300 AND
p.model_year = 2018;

#Return the products whose list prices are between 1,899 and 1,999.99.
SELECT (p.product_name) FROM production.products p 
WHERE p.list_price BETWEEN 1899 AND 1999;

#7. Use the IN operator to find products whose list price is 299.99 or 466.99 or 489.99. Order by price descending.

SELECT p.product_name, p.list_price FROM production.products p
WHERE p.list_price IN (299.99, 466.99, 489.99)
ORDER BY p.list_price DESC;

#8. Return the average list price in the products table of product names that include the word 'Cruiser'.

SELECT p.product_name, AVG(p.list_price) AS 'Average Price' FROM production.products p
GROUP BY p.product_name
HAVING p.product_name LIKE '%Cruiser%';

#9. Return the customer_id, first_name, last_name, and phone number of sales.customers table where phone is not null, order by last name descending.

SELECT c.customer_id, c.first_name, c.last_name, c.phone FROM sales.customers c
WHERE c.phone IS NOT NULL
ORDER BY c.last_name DESC;

#10. Use the cast function to explicitly filter orders from the orders table where requiredDate is greater than 2017-01-01 and 2017-01-31.

SELECT *  FROM sales.orders o
WHERE o.required_date BETWEEN '2017-01-01' AND '2017-01-31';








