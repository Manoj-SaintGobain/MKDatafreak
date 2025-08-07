--query on question
--List all customers from the USA.
SELECT name FROM CUSTOMERS WHERE country == "USA";

-- Find the total number of orders placed.
SELECT count(*) FROM Orderstable

--Get the names and emails of customers who placed an order.
SELECT DISTINCT c.name, c.email
FROM CUSTOMERS c
JOIN Orderstable o ON c.CUST_ID = o.CUST_ID;

--What is the total revenue generated from all orders
SELECT SUM(total_amount) FROM Orderstable;

--Which product has the highest price?
SELECT product_id,product_name,MAX(price),category FROM PRODUCTS

SELECT * FROM Products ORDER BY price DESC LIMIT 1;

--How many different categories of products are there?
SELECT DISTINCT(product_name) FROM PRODUCTS

--List all orders made after June 3, 2023.
SELECT CUST_ID FROM Orderstable WHERE order_date > '2023-06-03'
SELECT * FROM Orderstable WHERE order_date > '2023-06-03'

--Find the total quantity sold for each product.
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Order_Items_table oi
JOIN PRODUCTS p ON oi.product_id = p.product_id
GROUP BY p.product_name;

--Which customer spent the most money in total?
SELECT c.name,SUM(ot.total_amount) from CUSTOMERS c JOIN Orderstable ot 
on c.CUST_ID = ot.CUST_ID 
GROUP BY c.name
ORDER BY ot.total_amount DESC LIMIT 1

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM CUSTOMERS c
JOIN Orderstable o ON c.CUST_ID = o.CUST_ID
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

--List all products in the 'Electronics' category.
SELECT product_name,category FROM PRODUCTS WHERE category == 'Electronics'

--Show each customer and the number of orders they placed.
SELECT c.name,count(o.order_id)
FROM CUSTOMERS c join Orderstable o 
on c.CUST_ID = o.CUST_ID
group by c.name

SELECT c.name, COUNT(o.order_id) AS order_count
FROM CUSTOMERS c
LEFT JOIN Orderstable o ON c.CUST_ID = o.CUST_ID
GROUP BY c.name;

--What is the average order value?
SELECT AVG(total_amount) FROM Orderstable

SELECT AVG(total_amount) AS avg_order_value FROM Orderstable;

--List all orders with more than one item.

