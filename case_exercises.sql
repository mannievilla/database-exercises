USE employees;

-- Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 
-- DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

SELECT e.first_name, e.last_name, dept_no, de.from_date, de.to_date,
	CASE WHEN de.to_date > NOW() THEN 1
		ELSE 0
	END AS 'is_current_employee'
		
FROM employees AS e
JOIN dept_emp AS de ON
	e.emp_no = de.emp_no
;


-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' 
-- that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

-- SELECT first_name,
-- 	CASE 
--     WHEN first_name LIKE 'A%' OR 'B%' OR 'C%' OR 'D%' OR 'E%' OR 'F%' OR 'G%' OR 'H%' THEN 'A-H'
-- 	WHEN first_name LIKE 'I%' OR 'J%' OR 'K%' OR 'L%' OR 'M%' OR 'N%' OR 'O%' OR 'P%' OR 'Q%' THEN 'I-Q'
-- 	WHEN first_name LIKE 'R%' OR 'S%' OR 'T%' OR 'U%' OR 'V%' OR 'W%' OR 'X%' OR 'Y%' OR 'Z%' THEN 'R-Z'
-- 	END AS 'alpha_group'
-- FROM employees
-- ;

SELECT first_name,
	CASE 
        WHEN LEFT(last_name, 1) <= 'H' THEN 'A-H'
        WHEN SUBSTR(last_name, 1, 1) <= 'Q' THEN 'I-Q'
        WHEN LEFT(last_name, 1) <= 'Z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees
;


-- How many employees (current or previous) were born in each decade?

SELECT * 
FROM employees
ORDER BY birth_date ASC;

SELECT COUNT(*),
	CASE
		WHEN birth_date LIKE '195%' THEN '50s'
        WHEN birth_date LIKE '196%' THEN '60s'
	END AS 'birth_decade'
FROM employees
GROUP BY 2;


-- What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT *
FROM departments;

SELECT 
			CASE
			WHEN d.dept_name = 'Research' OR d.dept_name = 'Development' THEN 'R&D'
			WHEN d.dept_name = 'Sales' OR d.dept_name = 'Marketing' THEN 'Sales & Marketing'
			WHEN d.dept_name = 'Quality Management' OR d.dept_name = 'Production' THEN 'Prod & QM'
            WHEN d.dept_name = 'Finance' OR d.dept_name = 'Human Resources' THEN 'Finance & HR'
            ELSE d.dept_name
		END AS dept_grp, AVG(salary)
FROM departments AS d 
JOIN dept_emp AS de ON
	d.dept_no = de.dept_no
JOIN salaries AS s ON
	s.emp_no = de.emp_no
WHERE de.to_date > NOW() AND s.to_date > NOW()
GROUP BY dept_grp
;

