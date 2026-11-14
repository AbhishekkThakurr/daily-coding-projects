-- Student Marks Analysis
-- A self-contained SQL practice script: creates a table, inserts sample
-- rows, and runs a few useful queries (average, top scorer, filter).
--
-- Run with: sqlite3 :memory: < student-marks.sql
-- (or paste it into any MySQL / SQLite client; it uses standard SQL only.)

-- 1. Schema
CREATE TABLE students (
    id     INTEGER PRIMARY KEY,
    name   TEXT NOT NULL,
    subject TEXT NOT NULL,
    marks  INTEGER NOT NULL
);

-- 2. Sample data
INSERT INTO students (id, name, subject, marks) VALUES
    (1, 'Aarav',  'DBMS',  85),
    (2, 'Meera',  'DBMS',  92),
    (3, 'Rohan',  'Java',  78),
    (4, 'Sana',   'Java',  88),
    (5, 'Vikram', 'DBMS',  64),
    (6, 'Anita',  'Java',  95);

-- 3. All students, highest marks first
SELECT name, subject, marks FROM students ORDER BY marks DESC;
-- Expected result (6 rows):
-- Anita | Java | 95
-- Meera | DBMS | 92
-- Sana  | Java | 88
-- Aarav | DBMS | 85
-- Rohan | Java | 78
-- Vikram| DBMS | 64

-- 4. Average marks per subject
SELECT subject, ROUND(AVG(marks), 1) AS avg_marks
FROM students
GROUP BY subject;
-- Expected result (2 rows):
-- DBMS | 80.3
-- Java | 87.0

-- 5. Top scorer overall
SELECT name, subject, marks FROM students
ORDER BY marks DESC
LIMIT 1;
-- Expected result (1 row):
-- Anita | Java | 95

-- 6. Students who scored above 80
SELECT name, subject, marks FROM students
WHERE marks > 80
ORDER BY marks DESC;
-- Expected result (4 rows):
-- Anita | Java | 95
-- Meera | DBMS | 92
-- Sana  | Java | 88
-- Aarav | DBMS | 85
