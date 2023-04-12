-- This follows the tutorials of SQL Bolt Course with the Pixar Movies Database

-- @block
CREATE TABLE IF NOT EXISTS Movies(
    id INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Director VARCHAR(255),
    Year INT,
    Length_minutes INT
);

-- @block
INSERT INTO movies (Title, Director, Year, Length_minutes)
VALUES 
    ("Toy Story", "John Lasseter", 1995, 81),
    ("A Bug's Life", "John Lasseter", 1998, 95),
    ("Toy Story 2", "John Lasseter", 1999, 93),
    ("Monsters, Inc.", "Pete Docter", 2001, 92),
    ("Finding Nemo", "Andrew Stanton", 2003, 107),
    ("The Incredibles", "Brad Bird", 2004, 116),
    ("Cars", "John Lasseter", 2006, 117),
    ("Ratatouille",	"Brad Bird", 2007, 115),
    ("WALL-E", "Andrew Stanton", 2008, 104),
    ("Up", "Pete Docter", 2009, 101),
    ("Toy Story 3", "Lee Unkrich", 2010, 103),
    ("Cars 2", "John Lasseter", 2011, 120),
    ("Brave", "Brenda Chapman", 2012, 102),
    ("Monsters University",	"Dan Scanlon", 2013, 110),
    ("WALL-G",	"Brenda Chapman", 2042, 97);

-- @block
SELECT * FROM movies;


-- @block
-- SQL Bolt Lesson 1: SELECT queries 101 Exercises
SELECT Title FROM movies;    -- Find the title of each film

-- @block
SELECT Director from movies;     -- Find the director of each film

-- @block
SELECT Title, Director from movies;   -- Find the title and director of each film

-- @block
SELECT Title, Year from movies;   -- Find the title and year of each film




-- SQL Bolt Lesson 2: Queries with constraints (Pt. 1)
-- @block
-- Find the movie with a row id of 6
SELECT Title FROM movies
WHERE id = 6;

-- @block
-- Find the movies released in the years between 2000 and 2010
SELECT Title FROM Movies
WHERE Year between 2000 AND 2010;

-- @block
-- Find the movies not released in the years between 2000 and 2010
SELECT Title FROM Movies
WHERE Year < 2000 OR Year > 2010;

-- @block
-- Find the first 5 Pixar movies and their release year
SELECT id, Title, Year FROM Movies
WHERE id <= 5;

-- @block
-- Find all the Toy Story movies
SELECT Title FROM movies
WHERE Title LIKE "%Toy Story%";

-- @block
-- Find all the movies directed by John Lasseter
SELECT Title FROM movies
WHERE Director LIKE "%Lasseter%";

-- @block
-- Find all the movies (and director) not directed by John Lasseter
SELECT Title, Director FROM movies
WHERE Director NOT LIKE "%Lasseter%";

-- @block 
-- Find all the WALL-* movies
SELECT Title FROM movies
WHERE Title LIKE "%WALL-%";

-- @block 
-- List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT Director FROM movies
ORDER BY Director ASC;

-- @block
-- List the last four Pixar movies released (ordered from most recent to least)
SELECT Title, Year FROM movies
ORDER BY Year DESC
LIMIT 4;

-- @block
-- List the first five Pixar movies sorted alphabetically

-- SOLUTION I FIRST THOUGHT --> Interpreted "First five Pixar movies released, sorted alphabetically" which implies a nested ORDER BY
-- SELECT Title, Year FROM
-- (SELECT Title, Year FROM movies
-- ORDER BY Year
-- LIMIT 5)
-- AS Title,
-- ORDER BY Title ASC;

-- Actual Solution
SELECT Title, Year FROM movies
ORDER BY Title
LIMIT 5;

-- @block
-- List the next five Pixar movies sorted alphabetically
SELECT Title FROM movies
ORDER BY Title
LIMIT 5 OFFSET 5;

-- @block
CREATE TABLE IF NOT EXISTS Boxoffice(
    Movie_id INT NOT NULL PRIMARY KEY,
    Rating FLOAT(24),
    Domestic_sales INT,
    International_sales INT
);

-- @block
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Boxoffice.csv"
INTO TABLE Boxoffice
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- @block
SELECT * from Boxoffice;

-- @block
-- Find the domestic and international sales for each movie
SELECT Title, Domestic_sales, International_sales 
FROM movies
INNER JOIN Boxoffice
ON movies.id = Boxoffice.Movie_id;

-- @block
-- Show the sales numbers for each movie that did better internationally 
-- rather than domestically
SELECT Title, International_sales, Domestic_sales FROM movies
INNER JOIN Boxoffice
ON movies.id = Boxoffice.Movie_id
WHERE International_sales > Domestic_sales;

-- @block
-- List all the movies by their ratings in descending order
SELECT Title, Rating FROM movies
INNER JOIN Boxoffice
ON movies.id = Boxoffice.Movie_id
ORDER BY Rating DESC;
