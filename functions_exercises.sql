USE employees;

-- 2
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E'
;

-- 3
SELECT first_name, last_name, 
	CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E'
;

-- 4
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE 'E%E'
;

-- 5 
SELECT DATEDIFF(CURDATE(), hire_date)
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
;

-- 6
SELECT MIN(salary), MAX(salary)
FROM salaries;
-- SELECT * 
-- FROM salaries;

-- 7
SELECT first_name, last_name, CONCAT(
	SUBSTR(first_name, 1, 3), 
	SUBSTR(last_name, 1, 1), 
	SUBSTR(hire_date, 6, 10)
	) AS username
FROM employees;