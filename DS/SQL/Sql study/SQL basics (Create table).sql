-- Create Customer Table
CREATE TABLE CUSTOMERS(
CUST_ID INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
country VARCHAR(100)
);

INSERT INTO CUSTOMERS VALUES 
(1, 'Alice Smith', 'alice@example.com', 'USA'),
(2, 'Bob Johnson', 'bob@example.com', 'Canada'),
(3, 'Carol Davis', 'carol@example.com', 'UK'),
(4, 'David Brown', 'david@example.com', 'USA'),
(5, 'Emma Wilson', 'emma@example.com', 'Australia');

SELECT * from CUSTOMERS;

--CREATE Product TABLE
CREATE TABLE PRODUCTS(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(100),
price DECIMAL(10,2)
)

INSERT INTO PRODUCTS VALUES
(1,'Laptop','Electronics',1000),
(2,'Phone','Electronics',600),
(3,'Headphones','Accessory',150),
(4,'Cofee Maker','Home',120),
(5,'Notebook','Stationery',120)

SELECT * FROM PRODUCTS

-- Create Order TABLE
CREATE TABLE Orderstable(
    order_id INT PRIMARY KEY,
    CUST_ID INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMERS(CUST_ID)
);

INSERT INTO Orderstable VALUES
(1, 1, '2023-06-01', 1000),
(2, 2, '2023-06-03', 760),
(3, 1, '2023-06-05', 160),
(4, 3, '2023-06-07', 120),
(5, 4, '2023-06-09', 10);

SELECT * FROM Orderstable

-- CREATE order items

CREATE TABLE Order_Items_table (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orderstable(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items_table VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 3, 3, 1),
(5, 3, 4, 1),
(6, 4, 4, 1),
(7, 5, 5, 1),
(8, 5, 5, 2),
(9, 5, 5, 3);

SELECT * FROM Order_Items_table

DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;

INSERT INTO Order_Items_table VALUES
(19, 5, 5, 2),
(20, 5, 5, 3);
