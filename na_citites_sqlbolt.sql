CREATE TABLE IF NOT EXISTS North_american_cities(
    City VARCHAR(255),
    Country VARCHAR(255),
    Population INT,
    Latitude FLOAT(24),
    Longitude FLOAT(24)
);

-- @block
SELECT * FROM north_american_cities;

-- @block
-- Ignore Headers command? Error is because of column names
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/north_american_cities.csv"
INTO TABLE North_american_cities
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- @block
SELECT * FROM north_american_cities;

-- @block
-- List all the Canadian cities and their populations 
SELECT City, Population FROM north_american_cities
WHERE Country LIKE "%Canada%";

-- @block
-- Order all the cities in the United States by their latitude from north to south
SELECT City, Latitude FROM north_american_cities
WHERE Country LIKE "United States"
ORDER BY Latitude DESC;

-- @block
-- List all the cities west of Chicago, ordered from west to east
SELECT City from north_american_cities
WHERE Longitude < -87.629798
ORDER BY Longitude ASC;

-- @block
-- List the two largest cities in Mexico (by population)
SELECT City FROM north_american_cities
WHERE Country LIKE "Mexico"
ORDER BY Population DESC
LIMIT 2;

-- @block
-- List the third and fourth largest cities (by population) 
-- in the United States and their population
SELECT City FROM north_american_cities
WHERE Country LIKE "United States"
ORDER BY Population DESC
LIMIT 2 OFFSET 2;
