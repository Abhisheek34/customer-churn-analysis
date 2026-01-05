
/* =========================================================
   File: 02_data_cleaning.sql
   Project: Vodafone Customer Churn Analysis
   Purpose:
   - Standardize categorical text columns
   - Handle blank values caused by data import
   - Ensure data consistency for analysis and visualization
   ========================================================= */

use vodafone_churn;

select * from customers;



/* ---------------------------------------------------------
   Step 1: Trim extra spaces from text columns
   Reason:
   During CSV import, some categorical columns contained
   leading/trailing spaces, which appeared as blank values
   in DISTINCT checks.
   --------------------------------------------------------- */

SET SQL_SAFE_UPDATES = 0;


UPDATE customers
SET
    gender = TRIM(gender),
    StreamingMovies = TRIM(StreamingMovies),
    InternetService = TRIM(InternetService),
    Contract = TRIM(Contract),
    PaymentMethod = TRIM(PaymentMethod);

/* ---------------------------------------------------------
   Step 2: Handle blank values in categorical columns
   Observation:
   - Gender column had blank entries
   - StreamingMovies column had blank entries
   These were not NULL values but empty strings.
   --------------------------------------------------------- */

-- Replace blank gender values with 'Unknown'
UPDATE customers
SET gender = 'Unknown'
WHERE gender = '';

-- Replace blank StreamingMovies values with 'No' 
UPDATE customers
SET StreamingMovies = 'No'
WHERE StreamingMovies = '';


--  Validate cleaning results

SELECT DISTINCT gender FROM customers;
SELECT DISTINCT StreamingMovies FROM customers;



-- ------------------------------------------

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- No of Churned or Non-Churned Customers
SELECT Churn, COUNT(*) AS count
FROM customers
GROUP BY Churn;


-- check duplicates - No Duplicates
SELECT customerID, COUNT(*)
FROM customers
GROUP BY customerID
HAVING COUNT(*) > 1;

-- missing values in columns - No Missing Values
SELECT 
  SUM(tenure IS NULL) AS tenure_nulls,
  SUM(MonthlyCharges IS NULL) AS monthly_nulls,
  SUM(TotalCharges IS NULL) AS total_nulls
FROM customers;


