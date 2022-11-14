
/* 
Assignment3
Yingshi Liu 
CS 31A, Fall 2022

*/

Question 1: Display only employees with a start date before January 1, 2016 should be included. Display employee ID, job ID, first name, last name, and start date columns.

SELECT emp_id, job_id, first_name, last_name, start_date
FROM employee
WHERE start_date <  '2016-01-01'
;

-- Question 2: Display head teller employees who began working for the bank after January 1, 2011 OR those teller employees who began working after January 1, 2014.
-- Display employee ID, job ID, first name, last name, and start date columns.

SELECT emp_id, job_id, first_name, last_name, start_date
FROM employee
WHERE (job_id = 'HD_TEL' AND start_date >  '2011-01-01')
OR (job_id = 'CU_TEL' AND start_date >  '2014-01-01')
;

-- Question 3: Display the account ID, client ID, and available balance for all accounts with the status 'ACTIVE' and an available balance greater than $5,500.
-- Display account ID, client ID, and available balance.

SELECT account_id, client_id, avail_balance
FROM accounts
WHERE a_status = 'ACTIVE' AND avail_balance > 5500
;

-- Question 4: Display all non-business clients whose last name contains an a in the second position and an o anywhere after the a.
-- Display client ID, last name, first name, and available balance.

SELECT client_id, last_name, first_name
FROM individual_client
WHERE last_name LIKE '_a%o%'
;

-- Question 5: Display all accounts with between $3,000 and $5,000 of an available balance are returned. Make sure that you specify the lower amount first.

SELECT account_id, type_id, client_id, avail_balance
FROM accounts
WHERE avail_balance BETWEEN 3000 AND 5000
ORDER BY avail_balance
;

-- Question 6: You are searching for clients with a Social Security Number (SSN) that falls within a certain range.
-- The format for a Social Security number is “XXX-XX-XXXX” where X is a number from 0 to 9.
-- You want to find every client whose SSN lies between “500-00-0000” and “999-99-9999”.

SELECT client_id, fed_id
FROM clients
WHERE fed_id LIKE '___-___-____'
AND fed_id BETWEEN '500-00-0000' AND '999-99-9999'

;

-- Question 7: Display all accounts with a type ID that is either 'CHK', 'SAV', 'CD', or 'MM'.

SELECT account_id, type_id, client_id, avail_balance
FROM accounts
WHERE type_id IN ('CHK', 'SAV', 'CD', 'MM')
;

-- Question 8: Display the employee ID, first name, and last name of all employees with a last name that begins with 'F' or 'G'. Use an appropriate alias for your column headings.

SELECT emp_id, first_name, last_name
FROM employee
WHERE last_name LIKE 'F%'
OR last_name LIKE 'G%'
;
-- Question 9: Display all employees who are not managed by Helen Fleming (Helens employee ID is 184167702).

SELECT emp_id, first_name, last_name, manager_id
FROM employee
WHERE manager_id <> 184167702
OR manager_id IS NULL
;

-- Question 10: Display the client ID and address of all clients with an address that contains a lowercase ‘v’. Use an appropriate alias for your column headings.

SELECT client_id, address
FROM clients
WHERE address LIKE '%v%'
;

-- Question 11: Display the branch ID, branch name, and address of each branch with the location ID 10001.

SELECT branch_id, branch_name, address
FROM branch
WHERE loc_id = 10001
;
