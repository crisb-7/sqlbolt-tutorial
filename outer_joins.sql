CREATE TABLE IF NOT EXISTS Buildings(
    Building_name VARCHAR(2),
    Capacity INT
);

-- @block
INSERT INTO Buildings(Building_name, Capacity)
VALUES
    ("1e", 24),
    ("1w", 32),
    ("2e", 16),
    ("2w", 20);

-- @block
CREATE TABLE IF NOT EXISTS Employees(
    Role VARCHAR(255),
    Name VARCHAR(255),
    Building VARCHAR(2),
    Years_employed INT
);

-- @block
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employees.csv"
INTO TABLE Employees
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- @block
SELECT * FROM Buildings;

-- @block
SELECT * FROM employees;

-- @block
-- Find the list of all buildings that have employees 
SELECT DISTINCT Building FROM employees
LEFT JOIN Buildings
    ON Building_name = Building;

-- @block
-- Find the list of all buildings and their capacity
SELECT * FROM Buildings; -- Very dumb?

-- @block
-- List all buildings and the distinct employee roles 
-- in each building (including empty buildings)
SELECT DISTINCT Building_name, Role FROM Buildings
LEFT JOIN employees
    ON Building_name = Building;