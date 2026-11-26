-- Bank Accounts & Transactions Analysis
-- A self-contained practice script: three small tables (customers, accounts,
-- transactions) plus queries that answer real bank questions.
--
-- Run it in MySQL:
--   mysql -u root -p < bank-accounts.sql
-- Or in SQLite (this file uses only standard SQL, so it works there too):
--   sqlite3 :memory: < bank-accounts.sql
--
-- Expected results are shown in comments under each query.

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE accounts (
    account_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    account_type TEXT NOT NULL,
    balance INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE transactions (
    txn_id INTEGER PRIMARY KEY,
    account_id INTEGER NOT NULL,
    txn_type TEXT NOT NULL,
    amount INTEGER NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

INSERT INTO customers (customer_id, name, city) VALUES
    (1, 'Aarav', 'Panipat'),
    (2, 'Ishita', 'Delhi'),
    (3, 'Priya', 'Rohtak'),
    (4, 'Rahul', 'Karnal');

INSERT INTO accounts (account_id, customer_id, account_type, balance) VALUES
    (101, 1, 'Savings', 45000),
    (102, 2, 'Savings', 82000),
    (103, 3, 'Current', 12000),
    (104, 1, 'Current', 6000);

INSERT INTO transactions (txn_id, account_id, txn_type, amount) VALUES
    (1, 101, 'CREDIT', 5000),
    (2, 101, 'DEBIT', 2000),
    (3, 102, 'CREDIT', 10000),
    (4, 102, 'DEBIT', 3000),
    (5, 103, 'CREDIT', 8000),
    (6, 104, 'DEBIT', 1500),
    (7, 101, 'CREDIT', 3000),
    (8, 102, 'CREDIT', 2000);

-- Q1: Total balance held across all accounts.
SELECT SUM(balance) AS total_balance
FROM accounts;
-- Expected: 145000

-- Q2: Total balance of each customer (all their accounts combined),
-- richest first. Customers without an account do not appear.
SELECT c.name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.name
ORDER BY total_balance DESC;
-- Expected (richest first):
-- Ishita | 82000
-- Aarav  | 51000
-- Priya  | 12000

-- Q3: Customers who have no account yet (LEFT JOIN finds the missing rows).
SELECT c.name, c.city
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL;
-- Expected: Rahul | Karnal

-- Q4: Accounts whose total CREDIT amount is 8000 or more (GROUP BY + HAVING).
SELECT t.account_id, SUM(t.amount) AS total_credited
FROM transactions t
WHERE t.txn_type = 'CREDIT'
GROUP BY t.account_id
HAVING SUM(t.amount) >= 8000
ORDER BY total_credited DESC, t.account_id;
-- Expected:
-- 102 | 12000
-- 101 | 8000
-- 103 | 8000

-- Q5: Label every transaction as LARGE (amount >= 5000) or SMALL using CASE.
SELECT txn_id, account_id, txn_type, amount,
       CASE
           WHEN amount >= 5000 THEN 'LARGE'
           ELSE 'SMALL'
       END AS txn_size
FROM transactions
ORDER BY txn_id;
-- Expected:
-- 1 | 101 | CREDIT | 5000  | LARGE
-- 2 | 101 | DEBIT  | 2000  | SMALL
-- 3 | 102 | CREDIT | 10000 | LARGE
-- 4 | 102 | DEBIT  | 3000  | SMALL
-- 5 | 103 | CREDIT | 8000  | LARGE
-- 6 | 104 | DEBIT  | 1500  | SMALL
-- 7 | 101 | CREDIT | 3000  | SMALL
-- 8 | 102 | CREDIT | 2000  | SMALL
