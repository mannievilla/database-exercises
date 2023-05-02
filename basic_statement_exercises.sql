-- 1
USE albums_db;
SELECT database();

-- 2
DESCRIBE albums;
-- id is the primary key

-- 3
SELECT *
FROM albums
;	
-- name is the name of the album

-- 4
-- unit sales in millions

-- 5
SELECT name
FROM albums
WHERE artist = 'Pink Floyd'
;

-- 6
SELECT release_date
FROM albums
WHERE name LIKE 'Sgt.%'
;

-- 7
SELECT genre
FROM albums
WHERE name = 'Nevermind'
;

-- 8
SELECT name
FROM albums
WHERE release_date BETWEEN 1989 AND 1999
;

-- 9 
SELECT name AS low_selling_albums
FROM albums
WHERE sales < 20.0
;
-- SELECT *
-- FROM albums
-- ; 