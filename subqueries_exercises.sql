USE employees;
-- example --
SELECT * 
FROM employees;

SELECT *
FROM employees
WHERE first_name like 'Geor%'
;

SELECT g.birth_date, g.emp_no, g.first_name from
(
    SELECT *
    FROM employees
    WHERE first_name like 'Geor%'
) as g;



SELECT column_a, column_b, column_c
FROM table_a
WHERE column_a IN (
    SELECT column_a
    FROM table_b
);


-- 1 Find all the current employees with the same hire date as employee 101010 using a subquery.

-- SELECT hire_date
-- FROM employees AS e
-- WHERE emp_no = '101010';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (
					SELECT hire_date
					FROM employees
					WHERE emp_no = '101010') AND 
                    to
;


-- 2 Find all the titles ever held by all current employees with the first name Aamod.


SELECT first_name 
FROM employees
WHERE first_name = 'Aamod'
;

SELECT DISTINCT t.title
FROM (
		SELECT * 
		FROM employees
		WHERE first_name = 'Aamod') AS a 
JOIN titles AS t ON a.emp_no = t.emp_no
WHERE t.to_date > NOW()
;


-- 3 How many people in the employees table are no longer working for the company? 
-- Give the answer in a comment in your code.



SELECT *
FROM dept_emp
WHERE to_date NOT LIKE '999%'
;

SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (
		SELECT emp_no
		FROM dept_emp
		WHERE to_date LIKE '999%')
;

-- 4 Find all the current department managers that are female. 
-- List their names in a comment in your code.

SELECT emp_no
FROM employees
WHERE gender = 'F'
;


SELECT g.first_name, g.last_name
FROM (
		SELECT *
		FROM employees
		WHERE gender = 'F') AS g
JOIN dept_manager AS dm ON 
	g.emp_no = dm.emp_no
JOIN departments AS d ON
	dm.dept_no = d.dept_no
WHERE dm.to_date LIKE '99%'
;

-- 5 Find all the employees who currently have a higher salary than 
-- the companies overall, historical average salary. (63810.7448)

SELECT AVG(salary)
FROM salaries
;


SELECT first_name, last_name, e.emp_no, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE (
		SELECT AVG(salary)
		FROM salaries) < s.salary AND
		s.to_date > NOW()
GROUP BY e.emp_no, s.salary
;

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?

SELECT MAX(salary)
FROM salaries
;





SELECT COUNT(salary)
FROM salaries 
WHERE salary >
		(SELECT MAX(salary)
		FROM salaries
		WHERE to_date > NOW())-
		(SELECT STD(salary) 
		FROM salaries
		WHERE to_date > NOW())
AND to_date > NOW()
;
					