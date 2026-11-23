-- Online Store Orders Analysis
-- A self-contained practice script: three small tables (customers, products,
-- orders) plus queries that answer real shop questions.
--
-- Run it in MySQL:
--   mysql -u root -p < online-store-orders.sql
-- Or in SQLite (this file uses only standard SQL, so it works there too):
--   sqlite3 :memory: < online-store-orders.sql
--
-- Expected results are shown in comments under each query.

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price INTEGER NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO customers (customer_id, name, city) VALUES
    (1, 'Aarav', 'Panipat'),
    (2, 'Ishita', 'Delhi'),
    (3, 'Priya', 'Rohtak'),
    (4, 'Rahul', 'Karnal');

INSERT INTO products (product_id, name, price) VALUES
    (1, 'Keyboard', 1200),
    (2, 'Mouse', 600),
    (3, 'Monitor', 9500),
    (4, 'Headphones', 1800);

INSERT INTO orders (order_id, customer_id, product_id, quantity) VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 3, 1),
    (4, 2, 4, 2),
    (5, 3, 1, 1),
    (6, 3, 3, 1);

-- Q1: Total revenue of the store (price x quantity, summed over all orders).
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;
-- Expected: 26800

-- Q2: How much has each customer spent? Highest spender first.
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;
-- Expected (highest spender first):
-- Ishita | 13100
-- Priya  | 10700
-- Aarav  | 3000

-- Q3: Customers who never placed an order (LEFT JOIN finds the missing rows).
SELECT c.name, c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- Expected: Rahul | Karnal

-- Q4: Products ordered in total quantity of 2 or more (GROUP BY + HAVING).
SELECT p.name, SUM(o.quantity) AS total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.name
HAVING SUM(o.quantity) >= 2
ORDER BY total_sold DESC, p.name;
-- Expected:
-- Keyboard   | 3
-- Headphones | 2
-- Monitor    | 2

-- Q5: Label every order as BIG (amount >= 5000) or SMALL using CASE.
SELECT o.order_id, c.name AS customer, p.name AS product,
       p.price * o.quantity AS amount,
       CASE
           WHEN p.price * o.quantity >= 5000 THEN 'BIG'
           ELSE 'SMALL'
       END AS order_size
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_id;
-- Expected:
-- 1 | Aarav  | Keyboard   | 2400  | SMALL
-- 2 | Aarav  | Mouse      | 600   | SMALL
-- 3 | Ishita | Monitor    | 9500  | BIG
-- 4 | Ishita | Headphones | 3600  | SMALL
-- 5 | Priya  | Keyboard   | 1200  | SMALL
-- 6 | Priya  | Monitor    | 9500  | BIG
