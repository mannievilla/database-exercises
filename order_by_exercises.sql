-- 2
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC
;
-- First name in ascending order Irena Roccetti
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC
;
-- Last name in descending order Vidya Awdeh

-- 3
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name
;
-- First name in ascending order Irena Acton
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC, last_name
;
-- Last name in descending order Vidya Akiyama

-- 4
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name
;
-- First name in ascending order Irena Acton
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name
;
-- Last name in descending order Maya Zyda

-- 5
SELECT *
FROM employees
WHERE first_name LIKE 'E%E'
ORDER BY emp_no
;
-- number of employees 704
-- 10057 Ebbe Callaway
SELECT *
FROM employees
WHERE first_name LIKE 'E%E'
ORDER BY emp_no DESC
;
-- 499871
-- Elrique Walstra

-- 6
SELECT *
FROM employees
WHERE first_name LIKE 'E%E'
ORDER BY hire_date DESC
;
-- 445468 Elrique Norsworthy
SELECT *
FROM employees
WHERE first_name LIKE 'E%E'
ORDER BY hire_date
;
-- 424468 Elrique Pocchiola

-- 7
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY birth_date
;
-- 362 employees
-- 12885 Anwar Collavizza
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY birth_date DESC
;
-- 10681 Florina Garnier


SELECT *
FROM employees;

USE employees;