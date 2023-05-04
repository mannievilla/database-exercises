USE employees;

SELECT * 
FROM titles;

-- 2
SELECT DISTINCT title, COUNT(*) AS qty_of_titles
FROM titles
GROUP BY title
;
-- Senior Engineer 97750
-- Staff 107391
-- Engineer 115003
-- Senior Staff 92853
-- Assistant Engineer 15128
-- Technique Leader 15159
-- Manager 24


-- 3
SELECT last_name, COUNT(*)
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name
;

-- 4
SELECT last_name, COUNT(*)
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name
;


-- 5
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY 1
;

-- 6
SELECT last_name, COUNT(*) AS 'no_of_last_names'
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY 1
;

-- 7
SELECT first_name, COUNT(*) AS no_of_first_names
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY 1
;

-- 8
SELECT CONCAT(
	SUBSTR(first_name, 1, 3), 
	SUBSTR(last_name, 1, 1), 
	SUBSTR(hire_date, 6, 10)
	) AS username, COUNT(*) AS no_of_username
FROM employees
GROUP BY username
;

-- 9
SELECT CONCAT(
	SUBSTR(first_name, 1, 3), 
	SUBSTR(last_name, 1, 1), 
	SUBSTR(hire_date, 6, 10)
	) AS username, COUNT(*) AS no_of_username
FROM employees
GROUP BY username
ORDER BY 2 DESC
;

-- BONUS --

SELECT emp_no, CONCAT('$', ROUND(AVG(salary), 2)) AS avg_sal -- BONUS of the BONUS added the character $ FORMAT() and ROUND() are interchangeable
FROM salaries
GROUP BY emp_no
;


SELECT dept_no, SUM(emp_no) AS emp_per_dept -- SELECT the column that needs to be aggregated and pull the column you need to add a function
FROM dept_emp
GROUP BY dept_no
;


SELECT emp_no, COUNT(salary) 
FROM salaries
GROUP BY emp_no
;


SELECT emp_no, CONCAT('$', MAX(salary)) AS max_salary
FROM salaries
GROUP BY emp_no
;


SELECT emp_no, CONCAT('$', MIN(salary)) AS max_salary
FROM salaries
GROUP BY emp_no
;


SELECT emp_no, CONCAT('$', MAX(salary)) AS max_salary
FROM salaries
WHERE salary > 150000
GROUP BY emp_no
;


SELECT emp_no, CONCAT('$', ROUND(AVG(salary), 2)) AS AVG_salary
FROM salaries
WHERE salary BETWEEN 80000 AND 90000
GROUP BY emp_no
;





