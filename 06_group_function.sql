/*
Yingshi Liu
Assignment 06 sql file
9 Nov, 2022
*/

/*******************************************************************************************************************************************************************************
Question 1 :
Display the employee ID, employee status, and last name of all employees. The last name should
appear in uppercase letters.
*******************************************************************************************************************************************************************************/
SELECT e.emp_id,
		IF(e.end_date is NULL, "ACTIVE", "INACTIVE") AS emp_status,
        -- e.end_data AS emp_status,
        UPPER(e.last_name) AS last_name_upper
FROM employee e;

/*******************************************************************************************************************************************************************************
Question 2: 
Display all employees in each department and the names of departments with more than five
employees.
*******************************************************************************************************************************************************************************/
SELECT dept.dept_name,
	count(*) AS num_employees
FROM employee emp
JOIN department dept
USING (dept_id)
GROUP BY dept.dept_id
HAVING count(*) > 5;

/*******************************************************************************************************************************************************************************
Question 3: 
Display the client data order by the last three digits of the client’s federal ID number (which is either a Social Security Number for individual clients or a federal ID for business clients). Display client ID, client type ID, city, state, and federal ID columns.
********************************************************************************************************************************************************************************/
SELECT client.client_id,
		client.client_type_id,
        loc.city,
        loc.state,
        client.fed_id
FROM clients client
JOIN location loc
ON (client.loc_id = loc.location_id)
ORDER BY RIGHT(client.fed_id, 3);

/*******************************************************************************************************************************************************************************
Question 4: 
Display the total available balance by account type and branch where there is more than one account per type and branch. Order the results by total balance (highest to lowest).
********************************************************************************************************************************************************************************/
SELECT
	type_id,
	branch_id,
	sum(avail_balance) AS "total balance"
FROM accounts
GROUP BY type_id, branch_id
HAVING count(type_id) > 1
ORDER BY sum(avail_balance) DESC;

/* Suman */

SELECT
	type_id,
	branch_id,
	sum(avail_balance) AS "total balance"
FROM accounts
GROUP BY type_id, branch_id
HAVING count(account_id) > 1
ORDER BY sum(avail_balance) DESC;

/*******************************************************************************************************************************************************************************
Question 5: 
Display a narrative string for each bank teller employee.
********************************************************************************************************************************************************************************/
SELECT CONCAT(e.first_name, " ", e.last_name, " has been a ", job.job_id, " since ", e.start_date) AS emp_narrative
FROM employee e
JOIN jobs job
USING (job_id)
WHERE job.job_title LIKE "%Teller%";

/*******************************************************************************************************************************************************************************
Question 6: 
You are in charge of operations at the bank, and you would like to find out how many accounts are
being opened by each bank teller employee. Display any cases where an employee has opened fewer than five
accounts. Display open employee ID and how many accounts each teller employee has opened.
********************************************************************************************************************************************************************************/
SELECT 
	open_emp_id,
    count(account_id) AS how_many
FROM accounts
GROUP BY open_emp_id
HAVING count(account_id) < 5;

    
/*******************************************************************************************************************************************************************************
Question 7: 
Display the type ID column along with five aggregate functions.
********************************************************************************************************************************************************************************/
SELECT
	type_id,
    MAX(avail_balance) AS max_balance,
    MIN(avail_balance) AS min_balance,
    AVG(avail_balance) AS avg_balance,
    sum(avail_balance) AS total_balance,
    count(account_id) AS num_accts
FROM accounts
GROUP BY type_id;

/*******************************************************************************************************************************************************************************
Question 8: 
Display the total balances not only for each account, but for both types and branches (e.g., What is the total balance for all checking accounts opened at the San Francisco branch?). Filter out any type with a total available balance greater than $10,000.
********************************************************************************************************************************************************************************/
SELECT
	type_id,
    branch_id,
    sum(avail_balance) AS tot_balance
FROM accounts
GROUP BY type_id, branch_id
HAVING sum(avail_balance) > 10000;

/*******************************************************************************************************************************************************************************
Question 9: 
Display the total deposit balances for each client. Display the client ID, category ID, and the current
balance columns.
********************************************************************************************************************************************************************************/
SELECT
	acct.client_id,
    acct_type.category_id,
    sum(acct.avail_balance) AS cust_balance
FROM accounts acct
JOIN account_type acct_type
ON acct.type_id = acct_type.type_id
GROUP BY acct.client_id, acct_type.category_id;

/*******************************************************************************************************************************************************************************
Question 10: 
Display type ID, branch ID, open employee ID, and the total deposits of all accounts.Display the client data order by the last three digits of the client’s federal ID number (which is either a Social Security Number for individual clients or a federal ID for business clients). Display client ID, client type ID, city, state, and federal ID columns.
********************************************************************************************************************************************************************************/
SELECT
	type_id,
    branch_id,
    open_emp_id AS emp_id,
    sum(avail_balance) AS tot_deposits
FROM accounts
GROUP BY type_id, branch_id, open_emp_id;

/*******************************************************************************************************************************************************************************
Question 11: 
Display the number of accounts opened after December 31, 2000 and before January 1, 2016.D
********************************************************************************************************************************************************************************/
SELECT
	YEAR(created) AS year,
    count(account_id) AS num_account
FROM accounts
WHERE created > "2000-12-31"
AND created < "2016-01-01"
GROUP BY YEAR(created)

/*******************************************************************************************************************************************************************************
Question 12: 
Display the number of accounts held by each client. Display the client ID and the number of
accounts for each client. Include only clients  at least two accounts open.
********************************************************************************************************************************************************************************/
SELECT
	client_id,
    count(account_id) AS num_account
FROM accounts
GROUP BY client_id
HAVING count(account_id) >= 2;


/*******************************************************************************************************************************************************************************
Question 13: 
Display the employee last name who is first in an alphabetical list in the EMPLOYEE table along
with the last name who is last in that alphabetical list.
********************************************************************************************************************************************************************************/
SELECT
	MIN(last_name) AS "first last name",
    MAX(last_name) AS "last last name"
FROM employee;

