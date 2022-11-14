/*


*/

-- QUESTION 1
-- Write the CREATE TABLE statement for the GLOBAL_LOCATIONS table. 
-- Define the constraints at the column level.
-- Execute the CREATE TABLE statement. Use a single SQL statement to create that table. 
-- If you use more than one statement to do this part, you will receive 0 points for this query.
-- Run the DESCRIBE command on the GLOBAL_LOCATIONS table to view its structure. 


CREATE TABLE GLOBAL_LOCATIONS (
    id INT(4) PRIMARY KEY,
	loc_name VARCHAR(20),
	address VARCHAR(20),
	city VARCHAR(20),
	zip_postal_code VARCHAR(20),
	phone VARCHAR(15),
	email VARCHAR(15) UNIQUE,
	manager_id INT(4),
	emergency_contact VARCHAR(20)
);

DESC GLOBAL_LOCATIONS;

-- Question 2
-- Rewrite the CREATE TABLE statement for the LOCATIONS table to 
-- define the UNIQUE constraints at 
-- the table level. Do not execute this statement.  

CREATE TABLE GLOBAL_LOCATIONS (
	id INT(4),
	loc_name VARCHAR(20),
	address VARCHAR(20),
	city VARCHAR(20),
	zip_postal_code VARCHAR(20),
	phone VARCHAR(15),
	email VARCHAR(15),
	manager_id INT(4),
	emergency_contact VARCHAR(20),
	CONSTRAINT pk_id PRIMARY KEY (id),
	CONSTRAINT uni_email UNIQUE (email)
)

-- QUESTION 3
-- Alter the GLOBAL_LOCATIONS table to add a column that stores the 
-- date of open location. Run the 
-- DESCRIBE command again to verify the command was successful. 
-- Name this column date_opened and use an appropriate data type 
-- specification. You do not need to store any 
-- data to this column. 

ALTER TABLE GLOBAL_LOCATIONS
ADD date_opened DATE;
 
DESC GLOBAL_LOCATIONS;

-- QUESTION 4
-- Display column names and data types for the GLOBAL_LOCATIONS table. 

DESC GLOBAL_LOCATIONS;

-- QUESTION 5
-- Delete the date_opened column from the GLOBAL_LOCATIONS table. 

ALTER TABLE GLOBAL_LOCATIONS
DROP COLUMN date_opened;
DESC GLOBAL_LOCATIONS;

-- QUESTION 6
-- Rename the GLOBAL_LOCATIONS table as GLOBAL_LOCATIONS_BACKUP. 

ALTER TABLE GLOBAL_LOCATIONS
RENAME GLOBAL_LOCATIONS_BACKUP;

/*
RENAME TABLE old_table TO new_table;
*/

-- QUESTION 7
-- Using the column information for the EMPLOYEE_PAY table below, 
-- create the EMPLOYEE_PAY table. 
-- Write the syntax you will use to create the table.  
	-- Define the primary key (employee_id).  
	-- The social security number must be unique.  
	-- The salary and hire date columns cannot contain null values.  
		-- employee_id INT  
		-- ssn CHAR 
		-- salary NUMERIC 
		-- hire_date DATE  
        
CREATE TABLE EMPLOYEE_PAY (
	employee_id INT(4) PRIMARY KEY,
    ssn CHAR(11) UNIQUE,
    salary NUMERIC NOT NULL,
    hire_date DATE NOT NULL
);

DESC EMPLOYEE_PAY;

-- QUESTION 8
-- Enter one row into the table. Execute a SELECT * statement to 
-- verify your input. Refer to the graphic 
-- below for input.  
-- Write an INSERT statement that adds the employee information to
-- the EMPLOYEE_PAY table

INSERT INTO EMPLOYEE_PAY
VALUES (184167702, "744-04-9444", 5500, "2011-03-15");

SELECT * FROM EMPLOYEE_PAY;

-- QUESTION 9
-- Question  9: The  designers  may  decide  to  add  a  separate  
-- column  for  the  employee’s  email  address.  This  is  an 
-- optional column that is required to store 30 characters.  

ALTER TABLE EMPLOYEE_PAY
ADD COLUMN e_address CHAR(100);

DESC EMPLOYEE_PAY;

-- QUESTION 10
-- Display the names of the tables in your current database. 

SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE';

-- QUESTION 11
-- The designers  may decide that they do not need the email  
-- address column. Delete the e_address 
-- column from the EMPLOYEE_PAY table. 

ALTER TABLE EMPLOYEE_PAY
DROP e_address;

DESC EMPLOYEE_PAY;

-- QUESTION 12
-- Remove the GLOBAL_LOCATIONS_BACKUP table from the database. 
-- Display the names of the 
-- tables in your current database. 

DROP TABLE GLOBAL_LOCATIONS_BACKUP;

SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE';

-- QUESTION 13
-- Question 13: Enter one row into the CATEGORY table. 
-- Execute a SELECT * statement to verify your input.  
	-- Category ID: CD 
	-- Category Name: Certificat of Depocit 

DESC CATEGORY;

INSERT INTO CATEGORY
VALUES ("CD", "Certificat of Depocit");

SELECT * FROM CATEGORY;

-- QUESTION 14 
-- Update the misspelled name to Certificate of Deposit. 

UPDATE CATEGORY
SET category_name = "Certificate of Deposit"
WHERE category_id = "CD";




