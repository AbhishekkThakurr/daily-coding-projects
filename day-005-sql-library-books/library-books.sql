-- Library Books & Borrowing
-- A self-contained SQL practice script about a small college library.
-- It creates three tables, inserts sample rows, and practises JOINs:
-- INNER JOIN, LEFT JOIN, GROUP BY with HAVING, and a subquery.
--
-- Run with: sqlite3 :memory: < library-books.sql
-- (or paste it into any MySQL / SQLite client; it uses standard SQL only.)

-- 1. Schema
CREATE TABLE books (
    id     INTEGER PRIMARY KEY,
    title  TEXT NOT NULL,
    author TEXT NOT NULL
);

CREATE TABLE members (
    id   INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE borrowings (
    id        INTEGER PRIMARY KEY,
    book_id   INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    returned  INTEGER NOT NULL,  -- 0 = still out, 1 = returned
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (member_id) REFERENCES members (id)
);

-- 2. Sample data
INSERT INTO books (id, title, author) VALUES
    (1, 'Let Us C', 'Yashavant Kanetkar'),
    (2, 'Head First Java', 'Kathy Sierra'),
    (3, 'Database System Concepts', 'Silberschatz'),
    (4, 'Clean Code', 'Robert C. Martin');

INSERT INTO members (id, name) VALUES
    (1, 'Aarav'),
    (2, 'Meera'),
    (3, 'Rohan');

INSERT INTO borrowings (id, book_id, member_id, returned) VALUES
    (1, 1, 1, 1),
    (2, 2, 1, 0),
    (3, 2, 2, 1),
    (4, 3, 2, 0),
    (5, 1, 3, 0);

-- 3. Who borrowed which book (INNER JOIN across all three tables)
SELECT m.name AS member, b.title AS book
FROM borrowings br
JOIN members m ON m.id = br.member_id
JOIN books b ON b.id = br.book_id
ORDER BY m.name, b.title;
-- Expected result (5 rows):
-- Aarav | Head First Java
-- Aarav | Let Us C
-- Meera | Database System Concepts
-- Meera | Head First Java
-- Rohan | Let Us C

-- 4. Books currently out (not returned yet)
SELECT b.title, m.name AS borrowed_by
FROM borrowings br
JOIN books b ON b.id = br.book_id
JOIN members m ON m.id = br.member_id
WHERE br.returned = 0
ORDER BY b.title;
-- Expected result (3 rows):
-- Database System Concepts | Meera
-- Head First Java           | Aarav
-- Let Us C                  | Rohan

-- 5. Every book, plus who has it (if anyone) — LEFT JOIN keeps books
--    that were never borrowed in the result.
SELECT b.title,
       CASE WHEN m.name IS NULL THEN 'never borrowed' ELSE m.name END AS borrowed_by
FROM books b
LEFT JOIN borrowings br ON br.book_id = b.id AND br.returned = 0
LEFT JOIN members m ON m.id = br.member_id
ORDER BY b.title;
-- Expected result (4 rows):
-- Clean Code               | never borrowed
-- Database System Concepts | Meera
-- Head First Java          | Aarav
-- Let Us C                 | Rohan

-- 6. Members who borrowed more than one book (GROUP BY + HAVING)
SELECT m.name, COUNT(*) AS books_borrowed
FROM borrowings br
JOIN members m ON m.id = br.member_id
GROUP BY m.name
HAVING COUNT(*) > 1
ORDER BY books_borrowed DESC, m.name;
-- Expected result (2 rows):
-- Aarav | 2
-- Meera | 2

-- 7. Books borrowed at least once (subquery with IN)
SELECT title, author FROM books
WHERE id IN (SELECT DISTINCT book_id FROM borrowings)
ORDER BY title;
-- Expected result (3 rows):
-- Database System Concepts | Silberschatz
-- Head First Java          | Kathy Sierra
-- Let Us C                 | Yashavant Kanetkar
