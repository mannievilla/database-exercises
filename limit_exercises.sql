USE employees;

SELECT DISTINCT title 
FROM titles
ORDER BY 1 DESC
LIMIT 10
;

-- 2
SELECT DISTINCT last_name
FROM employees
ORDER BY 1 DESC
LIMIT 10
;
-- Zykh
-- Zyda
-- ZWicker
-- Zweizig
-- Zumaque
-- Zultner
-- Zucker
-- Zuberek
-- Zschoche
-- Zongker

-- 3
SELECT * 
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY hire_date 
LIMIT 5
;
-- Alselm Cappello
-- Utz Mandell
-- Bouchung Schreiter
-- Baocai Kushner
-- Petter Stroustrup

-- 4 
SELECT * 
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY hire_date 
LIMIT 5 OFFSET 45
;
-- Pranay Narwekar
-- Marjo Farrow
-- Ennio Karcich
-- Dines Lubachevsky
-- Ipke Fontan
-- *******
-- used this code to check mt answer in this question
-- SELECT * 
-- FROM employees
-- WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
-- ORDER BY hire_date 
-- LIMIT 50 
-- ;