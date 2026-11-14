# Student Marks Analysis (SQL)

A self-contained SQL practice script: it creates a `students` table, inserts
sample rows, and runs queries for ranking, averages, the top scorer, and a
filter. The expected result of every query is written in the comments.

## Concepts

- `CREATE TABLE` and `INSERT INTO`
- `ORDER BY ... DESC` and `LIMIT`
- `AVG()` with `GROUP BY`
- `WHERE` filtering

## How to run

```bash
sqlite3 :memory: < student-marks.sql
```

(Works in any standard SQL client — SQLite or MySQL.)

## Sample run

```text
$ sqlite3 :memory: < student-marks.sql
Anita|Java|95
Meera|DBMS|92
Sana|Java|88
Aarav|DBMS|85
Rohan|Java|78
Vikram|DBMS|64
DBMS|80.3
Java|87.0
Anita|Java|95
Anita|Java|95
Meera|DBMS|92
Sana|Java|88
Aarav|DBMS|85
```
