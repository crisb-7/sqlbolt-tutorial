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
LINES TERMINATED BY "\n";