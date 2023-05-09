-- Using the example from the lesson, create a temporary table called employees_with_departments that 
-- contains first_name, last_name, and dept_name for employees currently with that department. 
-- Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", 
-- it means that the query was attempting to write a new table to a database that you can only read.

USE quintela_2245;

CREATE TEMPORARY TABLE employees_with_departments( 
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_name VARCHAR(50)
);

SELECT *
FROM employees_with_departments
;

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the 
-- lengths of the first name and last name columns.

ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

-- Update the table so that the full_name column contains the correct data.

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments 
DROP COLUMN first_name,
DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?

CREATE TEMPORARY TABLE employees_with_departments( 
    full_name VARCHAR(50),
    dept_name VARCHAR(50)
);

-- Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer 
-- representing the number of cents of the payment. For example, 1.99 should become 199.


CREATE TEMPORARY TABLE my_payment
AS (SELECT payment_id, customer_id, staff_id, rental_id, amount * 100, payment_date, last_update
    FROM sakila.payment);


-- Go back to the employees database. Find out how the current average pay in each department 
-- compares to the overall current pay for everyone at the company. For this comparison, 
-- you will calculate the z-score for each salary. In terms of salary, what is the best 
-- department right now to work for? The worst?

USE employees;

SELECT AVG(salary)
FROM salaries
GROUP ;

