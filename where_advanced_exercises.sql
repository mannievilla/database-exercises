
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
WHERE (first_name = 'Irena' 
	OR first_name = 'Vidya' 
		OR first_name = 'Maya')
	AND gender = 'M'
;
-- 10200
-- 10397
-- 10821


-- 4
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%'
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

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
;
-- 10008
-- 10011
-- 10012

-- 9
SELECT *
FROM employees
WHERE MONTH(birth_date) = 12 AND day(birth_date) = 25;

SELECT * 
FROM employees 
WHERE birth_date LIKE '%12-25'
;
-- 10078
-- 10115
-- 10261


-- 10
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000
	AND (MONTH(birth_date) = 12 AND day(birth_date) = 25)
;

SELECT * 
FROM employees 
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
;
-- 10261
-- 10438
-- 10681


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