SELECT 'Hello World';

SELECT 2+2;

USE farmers_market;

SELECT database();
-- shows the database you are running farmers_market

SHOW tables;
-- shows tables in database

SELECT * 
FROM customer;

SHOW tables;

SELECT * 
FROM product;

SELECT product_id, product_name
FROM product;

SELECT product_id AS 'ID of Product', 
	product_name AS 'Name of Product'
FROM product;

SELECT * 
FROM product;
-- chekcing to see if any column changed from the prevous query

SELECT * 
FROM product
WHERE product_qty_type = 'lbs';


SELECT * 
FROM product
WHERE product_size LIKE 'med%';

-- not equal: != or <>

SELECT * 
FROM product
WHERE product_category_id != 1;

SELECT * 
FROM product_category;
-- Chcking to see what category is 1

SELECT * 
FROM customer_purchases;

SELECT * 
FROM customer_purchases
WHERE cost_to_customer_per_qty < 1.00;

SELECT * 
FROM customer_purchases
WHERE cost_to_customer_per_qty > 1.00;

SELECT *
FROM customer_purchases
WHERE cost_to_customer_per_qty BETWEEN .99 AND 3.00
;
-- the first number is exclusive and the last number is inclusive so the first 
-- number does not include the 1.00 and the last includes 3.00

SELECT DISTINCT product_id, vendor_id
FROM customer_purchases
;

-- order is implortant
SELECT *
WHERE cost_to_cutomer_per_qty > 1
FROM customer_purchases
;
-- showing hwo to order


-- clauses between advanced

USE farmers_market;

SELECT * 
FROM customer
WHERE customer_first_name LIKE '%ll%'
;
-- chooses names with 'll' in their name

SELECT *
FROM customer
WHERE customer_first_name NOT LIKE 'J%'
;
-- chooses name with no 'J' in their name

SELECT * 
FROM customer
WHERE customer_first_name IN ('Bob', 'Betty')
;
-- returns names with bob or betty

SELECT * 
FROM customer
WHERE customer_first_name NOT IN ('Bob', 'Betty')
;
-- returns names without bob or betty

-- NULL / NOT NULL

SELECT *
FROM product
WHERE product_qty_type IS NULL 
;
-- has values that are NULL

SELECT *
FROM product
WHERE product_qty_type IS NOT NULL
;
-- shows values that are present or NOT NULL

SELECT *
FROM product
WHERE product_size = 'medium' 
	AND product_qty_type = 'lbs'
;
-- shows that both qualifiers of medium and lbs

SELECT *
FROM product
WHERE product_size = 'medium' 
	OR product_qty_type = 'lbs'
;
-- shows either one or the other

SELECT *
FROM product
WHERE product_size = 'medium'
	AND product_category_id = 1 OR product_qty_type = 'lbs'
;
-- each is different 

SELECT *
FROM product
WHERE (product_size = 'medium' AND product_category_id = 1) 
	OR product_qty_type = 'lbs'
;
-- each is different

SELECT *
FROM product
WHERE product_size = 'medium'
	AND (product_category_id = 1 OR product_qty_type = 'lbs')
;
-- each is different



-- ORDER BY Clause

USE farmers_market;


SELECT *
FROM market_date_info
ORDER BY market_min_temp
;
-- Default order by ascending order 0-100

SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC
;
-- Changing to descending order


-- WE can sort by multiple columns

SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC, market_max_temp DESC
;
-- GOING BY THE FIRST NUMBER THEN THE SECOND. FIRST MIN TEMP IS DESC 
-- THEN MAX WHEN A DOUBLE MIN NUMBER IS PRESENT IT WILL BE DESC
SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC, market_max_temp ASC
;
-- GOING BY THE FIRST NUMBER THEN THE SECOND. FIRST MIN TEMP IS DESC 
-- THEN MAX WHEN A DOUBLE MIN NUMBER IS PRESENT IT WILL BE ASC

USE 311_data;

SELECT *
FROM cases;

-- limiting the query to just 10 rows
SELECT *
FROM cases
LIMIT 10
;


-- OFFSET
-- why you need this: pagintaion, snapshot of the data, skip ahead
SELECT * 
FROM cases
LIMIT 10 OFFSET 10
;


-- FUNCTIONS

-- numberic finctions  AVG() MIN() MAX()

USE farmers_market;

SELECT * 
FROM customer_purchases;

SELECT AVG(quantity)
FROM customer_purchases
;


SELECT AVG(quantity), MIN(quantity), MAX(quantity)
FROM customer_purchases
;

-- string functions CONCAT()

SELECT *
FROM customer
;

SELECT CONCAT(customer_first_name, customer_last_name)
FROM customer
;

SELECT customer_first_name, customer_last_name, 
	CONCAT(customer_first_name, ' ', customer_last_name) AS 'full_name'
FROM customer
;


-- sub string SUBSTR()

SELECT *
FROM product;

SELECT product_name
FROM product
;

SELECT product_name, SUBSTR(product_name, 1, 10) -- includes the 10th character (inclusive) it is the number of characters --
FROM product
;

SELECT product_name, SUBSTR(product_name, 5, 10) -- includes the 10th character (inclusive) it is the number of characters --
FROM product
;
-- used possibly for text that gets generated for use of limiting items etc. i.e. SHIRT W/TAGS RED AND ....


-- UPPER & LOWER  UPPER() LOWER()

SELECT * 
FROM customer;

SELECT customer_first_name
FROM customer;

SELECT customer_first_name, 
	UPPER(customer_first_name), 
	LOWER(customer_first_name)
FROM customer
;


-- Replace REPLACE()

SELECT *
FROM product;

SELECT product_size, REPLACE(product_size, 'medium', 'M') AS 'new_product_size'
FROM product
WHERE product_size = 'medium';


-- date function get the datetine for right now  NOW() CURDATE() CURTIME()


SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

-- Unix time stamp UNIX_TIMESTAMP()

SELECT UNIX_TIMESTAMP(); -- time from jan 1 1970 at midnight

SELECT UNIX_TIMESTAMP('1982-01-21');

SELECT CONCAT(
	'Teaching Data Science at CodeUp ',
	UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2022-05-23'),
    ' seconds'
);


-- Casting 

SELECT 2 + '2';

SELECT 10 - '5';

SELECT CONCAT(
	'Here is a number ', 5000
);

-- GROUP BY


USE farmers_market;

SELECT DISTINCT customer_first_name
FROM customer;

SELECT DISTINCT customer_first_name, customer_last_name
FROM customer
GROUP BY customer_first_name, customer_last_name
;


-- Group BY with agg functions

SELECT *
FROM customer_purchases;


SELECT customer_id, COUNT(*) AS purchases_made_by_customer
FROM customer_purchases
GROUP BY customer_id
;


SELECT *
FROM customer_purchases
;


SELECT customer_id, COUNT(*) 'purchases_made_by_customer' -- does not need the AS statement
FROM customer_purchases
GROUP BY customer_id
;


SELECT customer_id, COUNT(*) purchases_made_by_customer -- does not need the AS statement
FROM customer_purchases
GROUP BY customer_id
HAVING purchases_made_by_customer > 200
;


-- using a WHERE and a HAVING clause to show the difference of what they do HAVING - groups / WHERE - rows
SELECT customer_id, COUNT(*) AS high_end_purchases
FROM customer_purchases
WHERE cost_to_customer_per_qty > 4
GROUP BY 1 -- GROUP BY customer_id - can also use a number to represent the select statemnt according to order.
HAVING high_end_purchases < 100
;



USE farmers_market;

DESCRIBE vendor_booth_assignments;
-- has three primary keys

SELECT * 
FROM vendor_booth_assignments;

SHOW CREATE TABLE vendor_booth_assignments;


-- CREATE TABLE `vendor_booth_assignments` (
--   `vendor_id` int NOT NULL,
--   `booth_number` int NOT NULL,
--   `market_date` date NOT NULL,
--   PRIMARY KEY (`vendor_id`,`booth_number`,`market_date`),
--   KEY `market_date_fk_idx` (`market_date`),
--   KEY `booth_number_fk_idx` (`booth_number`),
--   CONSTRAINT `booth_number_fk` FOREIGN KEY (`booth_number`) REFERENCES `booth` (`booth_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
--   CONSTRAINT `market_date_fk` FOREIGN KEY (`market_date`) REFERENCES `market_date_info` (`market_date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
--   CONSTRAINT `vendor_id_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


DESCRIBE vendor;

SHOW CREATE TABLE vendor;


-- CREATE TABLE `vendor` (
--   `vendor_id` int NOT NULL AUTO_INCREMENT,
--   `vendor_name` varchar(45) NOT NULL,
--   `vendor_type` varchar(45) NOT NULL,
--   `vendor_owner_first_name` varchar(45) NOT NULL,
--   `vendor_owner_last_name` varchar(45) NOT NULL,
--   PRIMARY KEY (`vendor_id`),
--   UNIQUE KEY `vendor_id_UNIQUE` (`vendor_id`),
--   UNIQUE KEY `vendor_name_UNIQUE` (`vendor_name`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


SELECT *
FROM vendor;


SELECT *
FROM vendor_booth_assignments
JOIN vendor ON 
	vendor_booth_assignments.vendor_id = vendor.vendor_id;


SELECT *
FROM vendor_booth_assignments
JOIN vendor ON 
	vendor_booth_assignments.vendor_id = vendor.vendor_id
JOIN booth ON 
	booth.booth_number = vendor_booth_assignments.booth_number
;
-- i prefer to write this way versus the above because the order of the table joiner, I like it be in the middle. --
SELECT *
FROM vendor AS v
JOIN vendor_booth_assignments AS vba ON 
	v.vendor_id = vba.vendor_id
JOIN booth AS b ON 
	b.booth_number = vba.booth_number
;



DESCRIBE booth;
SHOW CREATE TABLE booth;





