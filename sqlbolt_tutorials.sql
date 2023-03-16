-- This follows the tutorials of SQL Bolt Course with the Pixar Movies Database

-- @block
CREATE TABLE Movies(
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
--Take a peek at the table
SELECT * FROM movies




-- SQL Bolt Lesson 1: SELECT queries 101 Exercises
-- @block
SELECT Title FROM movies    -- Find the title of each film

-- @block
SELECT Director from movies     -- Find the director of each film

-- @block
SELECT Title, Director from movies   -- Find the title and director of each film

-- @block
SELECT Title, Year from movies   -- Find the title and year of each film




-- SQL Bolt Lesson 2: Queries with constraints (Pt. 1)
-- @block
-- Find the movie with a row id of 6
SELECT Title FROM movies
WHERE id = 6

-- @block
-- Find the movies released in the years between 2000 and 2010
SELECT Title FROM Movies
WHERE Year between 2000 AND 2010

-- @block
-- Find the movies not released in the years between 2000 and 2010

-- @block
-- Find the first 5 Pixar movies and their release year