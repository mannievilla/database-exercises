
USE employees;
SELECT database();

-- 1
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
;
-- 10200
-- 10397
-- 10610

-- 2
SELECT * 
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya' 
		OR first_name = 'Maya'
;
-- 10200
-- 10397
-- 10610

-- 3
SELECT * 
FROM employees
WHERE first_name IN ('Irena' OR 'Vidya' OR 'Maya') 
	AND gender = 'male'
;
-- no employee match criteria

-- 4
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E'
;

-- 5
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' 
	OR last_name LIKE 'E%'
;

-- 6
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name NOT LIKE 'E%'
;

-- 7
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name LIKE 'E%'
;

-- 8
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000;
-- 10008
-- 10011
-- 10012

-- 9
SELECT *
FROM employees
WHERE MONTH(birth_date) = 12 AND day(birth_date) = 25;

-- 10
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000
	AND (MONTH(birth_date) = 12 AND day(birth_date) = 25)
;
-- 

-- 11
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%'
;

-- 12
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
;



-- SELECT *
-- FROM employees;