USE join_example_db;

SELECT *
FROM users;
SHOW CREATE TABLE users;
-- CREATE TABLE `users` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(100) NOT NULL,
--   `email` varchar(100) NOT NULL,
--   `role_id` int unsigned DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `role_id` (`role_id`),
--   CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
-- ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1


SELECT *
FROM roles;

SELECT * 
FROM users AS u
JOIN roles AS r ON
	u.role_id = r.id
;

SELECT r.name,
	COUNT(*) AS no_per_role
FROM users AS u
JOIN roles AS r ON
	u.role_id = r.id
GROUP BY r.name;


USE employees;

-- SELECT *
-- FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM departments;

SELECT * 
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM dept_emp;




-- 2
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS dp ON
	e.emp_no = dp.emp_no
JOIN departments AS d ON
	dp.dept_no = d.dept_no
WHERE dp.to_date LIKE '999%' 
ORDER BY 1
;

-- 3
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dp ON
	e.emp_no = dp.emp_no
JOIN departments AS d ON
	dp.dept_no = d.dept_no
WHERE dp.to_date LIKE '999%' AND gender ='F'
ORDER BY 1
;



-- 4
SELECT t.title, COUNT(*)
FROM dept_emp AS de
JOIN titles AS t ON 
    de.emp_no = t.emp_no
JOIN departments d ON 
	de.dept_no = d.dept_no
WHERE t.to_date LIKE '9%' AND d.dept_name = 'Customer Service' AND 
	de.to_date LIKE '9%' 
GROUP BY t.title
ORDER BY 1
;



-- 5
SELECT d.dept_name AS 'Department Name', 
	CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
    s.salary AS 'Salary'
FROM employees AS e
	JOIN dept_manager AS dp ON
		e.emp_no = dp.emp_no
	JOIN departments AS d ON
		dp.dept_no = d.dept_no
	JOIN salaries AS s ON
		e.emp_no = s.emp_no
WHERE dp.to_date LIKE '999%' AND s.to_date LIKE '9%'
ORDER BY 1
;





SELECT d.dept_name AS 'Department Name', 
	CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
    s.salary AS 'Salary'
FROM employees AS e
	JOIN dept_manager AS dp ON
		e.emp_no = dp.emp_no
	JOIN departments AS d ON
		dp.dept_no = d.dept_no
	JOIN salaries AS s ON
		e.emp_no = s.emp_no
WHERE dp.to_date LIKE '999%' AND s.to_date LIKE '9%'
ORDER BY 1
;



-- 6
SELECT d.dept_no, d.dept_name, COUNT(*)
FROM departments AS d
JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
JOIN employees AS e ON
	de.emp_no = e.emp_no
WHERE de.to_date LIKE '9%' 
GROUP BY d.dept_no, d.dept_name -- group by both select statements
ORDER BY 1
;


-- 7
SELECT d.dept_name, AVG(s.salary)
FROM departments AS d
JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
JOIN salaries AS s ON
	de.emp_no = s.emp_no
WHERE de.to_date LIKE '999%' AND s.to_date LIKE '9%'
GROUP BY d.dept_name
ORDER BY 1 DESC
LIMIT 1
-- ORDER BY 1
;


-- 8
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name'
FROM departments AS d
JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
JOIN salaries AS s ON
	de.emp_no = s.emp_no
JOIN employees AS e ON
	de.emp_no = e.emp_no
WHERE de.to_date LIKE '999%' AND d.dept_name LIKE 'Mar%' 
GROUP BY 1, s.salary
ORDER BY s.salary DESC
LIMIT 1
;



-- 9
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name', 
	CONCAT('$', s.salary) AS 'Salary',  
    d.dept_name AS 'Dept Name'
FROM departments AS d
JOIN dept_manager AS dm ON
	d.dept_no = dm.dept_no
JOIN salaries AS s ON
	dm.emp_no = s.emp_no
JOIN employees AS e ON
	dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '999%'
GROUP BY 1, s.salary, d.dept_name
ORDER BY s.salary DESC
LIMIT 1
;






-- 10
SELECT d.dept_name, AVG(s.salary)
FROM departments AS d
JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
JOIN salaries AS s ON
	de.emp_no = s.emp_no
WHERE de.to_date LIKE '999%' AND s.to_date LIKE '9%'
GROUP BY 1
ORDER BY 2 DESC
-- ORDER BY 1
;



SELECT d.dept_name, AVG(s.salary)
FROM departments AS d
JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
JOIN dept_manager AS dm ON
	d.dept_no = dm.dept_no
JOIN employees ON
	de.emp_no = employees.emp_no
JOIN employees ON
	dm.emp_no = employees.emp_no
JOIN salaries AS s ON
	employees.emp_no = s.emp_no
WHERE de.to_date LIKE '999%' AND employees.to_date LIKE '9%'
GROUP BY d.dept_name
ORDER BY 1 DESC
;

