# Employee Salary Analysis

A self-contained SQL practice script: it creates two tables (`departments`
and `employees`), loads sample data, and runs four analysis queries.

## Concepts

- `CREATE TABLE` with a foreign key
- `JOIN` to combine tables
- Aggregate functions (`AVG`, `MAX`) with `GROUP BY`
- Subqueries (scalar and correlated)
- `CASE` for conditional labels
- `ORDER BY` to sort results

## How to run

MySQL:

```bash
mysql -u root -p < employee-salary.sql
```

SQLite:

```bash
sqlite3 :memory: < employee-salary.sql
```

## Sample run

Query 1 — average salary per department:

```
Engineering|75000.0
Sales|57500.0
HR|50000.0
```

Query 2 — employees earning above the company average:

```
Ishita|82000
Aarav|75000
Rohan|68000
```

Query 3 — salary grade with `CASE`:

```
Ishita|82000|High
Aarav|75000|High
Rohan|68000|Medium
Kabir|61000|Medium
Priya|54000|Low
Arjun|52000|Low
Meera|48000|Low
```

Query 4 — highest-paid employee in each department:

```
Engineering|Ishita|82000
HR|Arjun|52000
Sales|Kabir|61000
```

The expected result of every query is also written as a comment in
`employee-salary.sql`.
