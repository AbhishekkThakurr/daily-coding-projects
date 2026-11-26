# Bank Accounts & Transactions Analysis (SQL)

A self-contained practice script for a small bank: three tables
(`customers`, `accounts`, `transactions`) and five queries that answer real
bank questions.

## What it does

- Builds the schema: customers, their accounts, and account transactions
  (with foreign keys).
- Inserts sample data: 4 customers, 4 accounts, 8 transactions.
- Answers five questions:
  1. Total balance held across all accounts
  2. Total balance of each customer (richest first)
  3. Customers who have no account yet
  4. Accounts with total credits of 8000 or more
  5. Every transaction labelled LARGE or SMALL by its amount

## Concepts used

- `CREATE TABLE`, `INSERT INTO`, foreign keys
- `JOIN` to combine customers with their accounts
- `LEFT JOIN` + `WHERE ... IS NULL` to find missing rows
- `SUM`, `GROUP BY`, `HAVING`, `ORDER BY`
- `CASE ... WHEN` for conditional labels
- `WHERE` filtering before aggregation (credits only)

## How to run

MySQL:

```bash
mysql -u root -p < bank-accounts.sql
```

SQLite (the file uses only standard SQL, so it works there too):

```bash
sqlite3 :memory: < bank-accounts.sql
```

## Sample run (SQLite)

```text
$ sqlite3 :memory: < bank-accounts.sql
145000
Ishita|82000
Aarav|51000
Priya|12000
Rahul|Karnal
102|12000
101|8000
103|8000
1|101|CREDIT|5000|LARGE
2|101|DEBIT|2000|SMALL
3|102|CREDIT|10000|LARGE
4|102|DEBIT|3000|SMALL
5|103|CREDIT|8000|LARGE
6|104|DEBIT|1500|SMALL
7|101|CREDIT|3000|SMALL
8|102|CREDIT|2000|SMALL
```

Each query's expected result is also written in a comment right below it in
`bank-accounts.sql`.
