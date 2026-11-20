-- Employee Salary Analysis
-- A self-contained practice script: creates the schema, loads sample data,
-- and runs analysis queries. Works in MySQL and SQLite.
-- Run (MySQL):  mysql -u root -p < employee-salary.sql
-- Run (SQLite): sqlite3 :memory: < employee-salary.sql

CREATE TABLE departments (
    dept_id   INTEGER PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id    INTEGER PRIMARY KEY,
    emp_name  VARCHAR(50) NOT NULL,
    dept_id   INTEGER NOT NULL,
    salary    DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
    (1, 'Engineering'),
    (2, 'Sales'),
    (3, 'HR');

INSERT INTO employees (emp_id, emp_name, dept_id, salary) VALUES
    (101, 'Aarav',  1, 75000.00),
    (102, 'Ishita', 1, 82000.00),
    (103, 'Rohan',  1, 68000.00),
    (104, 'Priya',  2, 54000.00),
    (105, 'Kabir',  2, 61000.00),
    (106, 'Meera',  3, 48000.00),
    (107, 'Arjun',  3, 52000.00);

-- 1. Average salary per department
SELECT d.dept_name, ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC;

-- Expected result:
-- Engineering | 75000.00
-- Sales       | 57500.00
-- HR          | 50000.00

-- 2. Employees earning more than the company average salary
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- Expected result:
-- Ishita | 82000.00
-- Aarav  | 75000.00
-- Rohan  | 68000.00

-- 3. Salary grade using CASE
SELECT emp_name, salary,
       CASE
           WHEN salary >= 70000 THEN 'High'
           WHEN salary >= 55000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_grade
FROM employees
ORDER BY salary DESC;

-- Expected result:
-- Ishita | 82000.00 | High
-- Aarav  | 75000.00 | High
-- Rohan  | 68000.00 | Medium
-- Kabir  | 61000.00 | Medium
-- Priya  | 54000.00 | Low
-- Arjun  | 52000.00 | Low
-- Meera  | 48000.00 | Low

-- 4. Highest-paid employee in each department
SELECT d.dept_name, e.emp_name, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary) FROM employees WHERE dept_id = e.dept_id
)
ORDER BY d.dept_name;

-- Expected result:
-- Engineering | Ishita | 82000.00
-- HR          | Arjun  | 52000.00
-- Sales       | Kabir  | 61000.00
