-- 3
SHOW databases;

-- 4
USE albums_db;

-- 5
SELECT database();

-- 6
SHOW tables;

-- 7
USE employees;

-- 8
SELECT database();

-- 9
SHOW tables;

-- 10
DESCRIBE employees.employees;

-- 11
-- Which table(s) do you think contain a numeric type column? 
DESCRIBE employees.departments;
DESCRIBE employees.dept_emp;
DESCRIBE employees.dept_manager;
DESCRIBE employees.employees;
DESCRIBE employees.salaries;
DESCRIBE employees.titles;
-- ALL except the departments

-- 12
-- Which table(s) do you think contain a string type column?
-- all except for salary table

-- 13
-- Which table(s) do you think contain a date type column?
-- ALL except for the department


-- 14
-- -- What is the relationship between the employees and the departments tables?
-- There is no realtionship you have to use dept_emp and dept_manager to tie employees to depraprtments

-- 15
-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;
-- SHOW CREATE TABLE departments;
-- SHOW CREATE TABLE dept_emp;
-- SHOW CREATE TABLE employees;
-- SHOW CREATE TABLE salaries;
-- SHOW CREATE TABLE titles;
-- CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1
