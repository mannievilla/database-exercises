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
-- Dark Side of the Moon
-- The Wall

-- 6
SELECT release_date
FROM albums
WHERE name LIKE 'Sgt.%'
;
-- 1967

-- 7
SELECT genre
FROM albums
WHERE name = 'Nevermind'
;
-- Grunge, Alternative rock

-- 8
SELECT name
FROM albums
WHERE release_date BETWEEN 1989 AND 1999
;
-- The Bodyguard
-- Jagged Little Pill
-- Come On Over
-- Falling into You
-- Let's Talk About Love
-- Dangerous
-- The Immaculate Collection
-- Titanic: Music from the Motion Picture
-- Metallica
-- Nevermind
-- Supernatural

-- 9 
SELECT name AS low_selling_albums
FROM albums
WHERE sales < 20.0
;
-- Grease: The Original Soundtrack from the Motion Picture
-- Bad
-- Sgt. Pepper's Lonely Hearts Club Band
-- Dirty Dancing
-- Let's Talk About Love
-- Dangerous
-- The Immaculate Collection
-- Abbey Road
-- Born in the U.S.A.
-- Brothers in Arms
-- Titanic: Music from the Motion Picture
-- Nevermind
-- The Wall

-- SELECT *
-- FROM albums
-- ; 





