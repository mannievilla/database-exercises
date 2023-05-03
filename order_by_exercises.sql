-- 2
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name 
;
-- First name in ascending order Irena Reutenauer
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
WHERE last_name LIKE 'E%E'
ORDER BY emp_no
;
-- number of employees 704
-- 10021 Ramzi Erde
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no DESC
;
-- 499648
-- Tadhiro Erde

-- 6
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date DESC
;
-- 67892 Teiji Eldridge
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date
;
-- 233488 Sergi Erde

-- 7
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date DESC
;
-- 362 employees
-- 33936 Khun Bernini
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY birth_date DESC, hire_date DESC
;
-- 451819 Gudjon Vakili

SELECT *
FROM employees;

USE employees;