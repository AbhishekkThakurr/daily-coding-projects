# Online Store Orders Analysis (SQL)

A self-contained practice script for a small online store: three tables
(`customers`, `products`, `orders`) and five queries that answer real shop
questions.

## What it does

- Builds the schema: customers, products, and orders (with foreign keys).
- Inserts sample data: 4 customers, 4 products, 6 orders.
- Answers five questions:
  1. Total revenue of the store
  2. How much each customer has spent (highest first)
  3. Customers who never placed an order
  4. Products sold in quantity 2 or more
  5. Every order labelled BIG or SMALL by its amount

## Concepts used

- `CREATE TABLE`, `INSERT INTO`, foreign keys
- `JOIN` (inner join across three tables)
- `LEFT JOIN` + `WHERE ... IS NULL` to find missing rows
- `SUM`, `GROUP BY`, `HAVING`, `ORDER BY`
- `CASE ... WHEN` for conditional labels
- Subquery-free aggregation (each query stands on its own)

## How to run

MySQL:

```bash
mysql -u root -p < online-store-orders.sql
```

SQLite (the file uses only standard SQL, so it works there too):

```bash
sqlite3 :memory: < online-store-orders.sql
```

## Sample run (SQLite)

```text
$ sqlite3 :memory: < online-store-orders.sql
26800
Ishita|13100
Priya|10700
Aarav|3000
Rahul|Karnal
Keyboard|3
Headphones|2
Monitor|2
1|Aarav|Keyboard|2400|SMALL
2|Aarav|Mouse|600|SMALL
3|Ishita|Monitor|9500|BIG
4|Ishita|Headphones|3600|SMALL
5|Priya|Keyboard|1200|SMALL
6|Priya|Monitor|9500|BIG
```

Each query's expected result is also written in a comment right below it in
`online-store-orders.sql`.
