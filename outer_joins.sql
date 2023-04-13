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
SELECT * FROM Employees;

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

-- @block
-- Test
SELECT * FROM Buildings
RIGHT JOIN Employees
    ON Building_name = Building;

-- @block
-- Find the name and role of all employees who have not been assigned to a building
-- (These rows are not in this table)
SELECT Name, Role FROM Employees
WHERE Building IS NULL;

-- @block
-- Find the names of the buildings that hold no employees
SELECT Building_name, Role FROM Buildings
LEFT JOIN Employees
    ON Building_name = Building
WHERE Role IS NULL;