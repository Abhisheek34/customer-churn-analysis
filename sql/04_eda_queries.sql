/* =========================================================
   File: 04_eda_queries.sql
   Project: Vodafone Customer Churn Analysis
   Purpose:
   - Perform exploratory data analysis (EDA)
   - Understand overall customer churn distribution
   - Identify high-level churn patterns for further analysis
   ========================================================= */

USE vodafone_churn;

/* ---------------------------------------------------------
   1: Overall Churn Overview
   - Analyze the distribution of churned vs retained customers
   - Establish a baseline understanding of churn in the dataset
   --------------------------------------------------------- */

SELECT 
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Churn;


/* ---------------------------------------------------------
   2: Churn by Key Customer Segments
   - Analyze churn distribution across major customer segments
   - Identify early churn patterns by contract, tenure, and payment method
   --------------------------------------------------------- */

-- Churn by Contract Type
SELECT 
    Contract,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Contract, Churn
ORDER BY Contract;

-- Churn by Tenure Group
SELECT 
    tenure_group,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY tenure_group, Churn
ORDER BY tenure_group;

-- Churn by Payment Method
SELECT 
    PaymentMethod,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod;

/* ---------------------------------------------------------
	3: Numerical Overview
   - Review distribution of key numerical variables
   - Understand customer tenure and billing patterns
   --------------------------------------------------------- */

-- Tenure distribution
SELECT 
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    AVG(tenure) AS avg_tenure
FROM customers;

-- Monthly charges distribution
SELECT 
    MIN(MonthlyCharges) AS min_monthly_charges,
    MAX(MonthlyCharges) AS max_monthly_charges,
    AVG(MonthlyCharges) AS avg_monthly_charges
FROM customers;

