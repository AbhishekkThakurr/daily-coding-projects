# Library Books & Borrowing (SQL)

A self-contained SQL practice script about a small college library. It creates three tables (`books`, `members`, `borrowings`) and practises the JOINs that come up again and again: `INNER JOIN`, `LEFT JOIN`, `GROUP BY` with `HAVING`, and a subquery with `IN`.

## Concepts

- Three-table schema with `FOREIGN KEY` links
- `INNER JOIN` across `borrowings`, `members`, and `books`
- `LEFT JOIN` to keep rows that have no match (books never borrowed)
- `GROUP BY` + `HAVING` to filter groups (members with more than one book)
- A subquery with `IN` (`books borrowed at least once`)
- `CASE WHEN` to show a friendly label instead of `NULL`

## How it works

`borrowings` is the link table: each row says which member borrowed which book and whether it was returned (`returned = 0` means still out). The queries join through it to answer questions like "who has which book right now?" and "which books were never borrowed?"

## How to run

```bash
sqlite3 :memory: < library-books.sql
```

## Sample run

```
$ sqlite3 :memory: < library-books.sql
Aarav|Head First Java
Aarav|Let Us C
Meera|Database System Concepts
Meera|Head First Java
Rohan|Let Us C
Database System Concepts|Meera
Head First Java|Aarav
Let Us C|Rohan
Clean Code|never borrowed
Database System Concepts|Meera
Head First Java|Aarav
Let Us C|Rohan
Aarav|2
Meera|2
Database System Concepts|Silberschatz
Head First Java|Kathy Sierra
Let Us C|Yashavant Kanetkar
```

The five result blocks are, in order: who borrowed which book; books currently out; every book with its borrower (or "never borrowed"); members with more than one book; books borrowed at least once. The expected result of each query is also written in the comments inside `library-books.sql`.
