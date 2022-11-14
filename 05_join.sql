/*
Yingshi Liu
Assignment05
10/31/2022
*/

/*******************************************************************************************************************************************************************************
Question 1 :
For all accounts opened on May 23, 2015, write a SQL statement that displays the account ID, created date of the account, and client ID.
*******************************************************************************************************************************************************************************/
SELECT
  account_id,
  created,
  client_id
FROM
  accounts
WHERE
  created = '2015-05-23';

/*******************************************************************************************************************************************************************************
Question 2 :
For all accounts, write a SQL statement that lists the account ID, created date, type ID, account name, and category ID for each type that
make up the account. Order the rows by category ID and then by account ID.
*******************************************************************************************************************************************************************************/
SELECT
  accts.account_id,
  accts.created,
  accts.type_id,
  acct_type.account_name,
  acct_type.category_id
FROM
  accounts accts
  INNER JOIN account_type acct_type
  	ON accts.type_id = acct_type.type_id
ORDER BY
  acct_type.category_id,
  accts.account_id;

/*******************************************************************************************************************************************************************************
Question 3 :
Display all transactions by Reya Swanson in her checking account. Display the transaction ID, transaction type, transaction date, and the amount.
*******************************************************************************************************************************************************************************/
SELECT
  accts.trans_id,
  accts.trans_type,
  accts.trans_date,
  accts.amount
FROM
  account_trans trans
  INNER JOIN accounts accts
  	ON trans.account_id = accts.account_id
  INNER JOIN individual_client client
  	ON accts.client_id = client.client_id
WHERE
  client.first_name = 'Reya'
  AND client.last_name = 'Swanson';

/*******************************************************************************************************************************************************************************
Question 4 :
Display all account names along with account IDs. (Use the type_id column in the accounts table to link to the ACCOUNT_TYPE table).
Include all accounts, even if no accounts have been opened for that type.
*******************************************************************************************************************************************************************************/
SELECT
  acct_type.type_id,
  accts.account_id,
  accts.client_id,
  accts.avail_balance,
  acct_type.account_name
FROM
  account_type acct_type
  LEFT JOIN accounts accts
  	ON acct_type.type_id = accts.type_id;

/*******************************************************************************************************************************************************************************
Question 5 :
Display all accounts opened by experienced tellers who were hired before January 1, 2007 and currently assigned to the Chicago branch.
Display account ID, client ID, created date, and type ID.
*******************************************************************************************************************************************************************************/
SELECT
  accts.account_id,
  accts.client_id,
  accts.created,
  accts.type_id
FROM
  accounts accts
  INNER JOIN employee emp
  	ON accts.open_emp_id = emp.emp_id
  INNER JOIN branch
  	ON accts.branch_id = branch.branch_id
WHERE
  emp.start_date < '2007-01-01'
  AND branch.branch_name = 'Chicago Branch';

/*******************************************************************************************************************************************************************************
Question 6 :
Display the account ID, federal tax number, first name and last name for all non-business accounts.
*******************************************************************************************************************************************************************************/
SELECT
  accts.account_id,
  clients.fed_id,
  ind_client.first_name,
  ind_client.last_name
FROM
  accounts accts
  INNER JOIN clients
  	ON accts.client_id = clients.client_id
  INNER JOIN individual_client ind_client
  	ON clients.client_id = ind_client.client_id;

/*******************************************************************************************************************************************************************************
Question 7 :
Display each employee along with every checking account they helped open. Also, display their employee ID and branch name where
these accounts were opened.
*******************************************************************************************************************************************************************************/
SELECT
	a.account_id,
    e.emp_id,
    b.branch_name AS acc_branch,
    b.branch_name AS emp_branch
    
FROM employee e 
INNER JOIN accounts a
ON e.emp_id = a.open_emp_id
INNER JOIN branch b
ON a.branch_id = b.branch_id
WHERE a.type_id = "CHK";

/*******************************************************************************************************************************************************************************
Question 8 :
Use the union all operator to generate a full set of client data from the INDIVIDUAL_CLIENT and BUSINESS_CLIENT tables.
*******************************************************************************************************************************************************************************/
SELECT
  client_id,
  last_name AS last_name_or_business_name
FROM
  individual_client

UNION ALL

SELECT
  client_id,
  bus_name AS last_name_or_business_name
FROM
  business_client;

/*******************************************************************************************************************************************************************************
Question 9 :
Display the available balance from each account belonging to a client named George Major.
*******************************************************************************************************************************************************************************/
SELECT
  accts.avail_balance
FROM
  accounts accts
  INNER JOIN individual_client ind_client
  	ON accts.client_id = ind_client.client_id
WHERE
  ind_client.first_name = 'George'
  AND ind_client.last_name = 'Major';

/*******************************************************************************************************************************************************************************
Question 10 :
Display all accounts along with either a) the first name and last name of individual clients OR b) the business name of business clients.
*******************************************************************************************************************************************************************************/
SELECT
  accts.account_id,
  accts.type_id,
  CONCAT(ind_client.first_name, ' ', ind_client.last_name) AS person_name,
  bus_client.bus_name AS business_name
FROM
  accounts accts
  LEFT JOIN individual_client ind_client
  	ON accts.client_id = ind_client.client_id
  LEFT JOIN business_client bus_client
  	ON accts.client_id = bus_client.client_id;

/*******************************************************************************************************************************************************************************
Question 11 :
Display a list of all employees and, if applicable, their manager.
*******************************************************************************************************************************************************************************/
SELECT
  emp.first_name,
  emp.last_name,
  mgr.first_name AS mgr_first_name,
  mgr.last_name AS mgr_last
FROM
  employee emp
  LEFT JOIN employee mgr
  	ON emp.manager_id = mgr.emp_id;

/*******************************************************************************************************************************************************************************
Question 12 :
Display the account ID, client last name, federal ID, and account names. Display the first 10 rows in the result set.
*******************************************************************************************************************************************************************************/
SELECT
  accts.account_id,
  ind_client.last_name,
  clients.fed_id,
  acct_type.account_name
FROM
  accounts accts
  INNER JOIN individual_client ind_client
  	ON accts.client_id = ind_client.client_id
  INNER JOIN clients
  	ON accts.client_id = clients.client_id
  INNER JOIN account_type acct_type
  	ON accts.type_id = acct_type.type_id
LIMIT
  10;

/*******************************************************************************************************************************************************************************
Question 13 :
For all accounts, write a SQL statement that lists the account ID, created date, type ID, account name, and category ID for each type that
make up the account. Order the rows by category ID and then by account ID.
*******************************************************************************************************************************************************************************/
SELECT
  accts.account_id,
  accts.created,
  accts.type_id,
  acct_type.account_name,
  acct_type.category_id
FROM
  accounts accts
  INNER JOIN account_type acct_type
  	ON accts.type_id = acct_type.type_id
ORDER BY
  acct_type.category_id,
  accts.account_id;
