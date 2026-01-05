/* ---------------------------------------------------------
   1. Churn by Customer Demographics
   Description:
   - Analyze churn patterns across key demographic attributes
   --------------------------------------------------------- */

-- Churn by Gender
SELECT
    gender,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY gender, Churn
ORDER BY gender;

-- Churn by Senior Citizen
SELECT
    SeniorCitizen,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY SeniorCitizen, Churn
ORDER BY SeniorCitizen;

-- Churn by Dependents
SELECT
    Dependents,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Dependents, Churn
ORDER BY Dependents;


/* ---------------------------------------------------------
   2. Churn by Contract Type
   --------------------------------------------------------- */

SELECT
    Contract,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Contract, Churn
ORDER BY Contract;

/* ---------------------------------------------------------
   3. Churn by Tenure Group
   --------------------------------------------------------- */

SELECT
    tenure_group,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY tenure_group, Churn
ORDER BY tenure_group;

/* ---------------------------------------------------------
   4. Churn vs Billing Behavior
   --------------------------------------------------------- */

-- Monthly Charges by Churn
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customers
GROUP BY Churn;

-- Total Charges by Churn
SELECT
    Churn,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM customers
GROUP BY Churn;



/* ---------------------------------------------------------
   5. Churn by Payment Method
   --------------------------------------------------------- */

SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod;

/* ---------------------------------------------------------
   5.6 Impact of Customer Support on Churn
   --------------------------------------------------------- */

-- Average administrative tickets by churn status
SELECT
    Churn,
    ROUND(AVG(numAdminTickets), 2) AS avg_admin_tickets
FROM customers
GROUP BY Churn;

-- Average technical tickets by churn status
SELECT
    Churn,
    ROUND(AVG(numTechTickets), 2) AS avg_tech_tickets
FROM customers
GROUP BY Churn;

/* ---------------------------------------------------------
   6. Impact of Customer Support on Churn
   --------------------------------------------------------- */

-- Average administrative tickets by churn status
SELECT
    Churn,
    ROUND(AVG(numAdminTickets), 2) AS avg_admin_tickets
FROM customers
GROUP BY Churn;


/* ---------------------------------------------------------
   5.7 Geographic Churn Analysis
   --------------------------------------------------------- */

SELECT
    Location,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Location, Churn
ORDER BY customer_count DESC;



SELECT
    Location,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS churn_no,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_yes,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Location
ORDER BY churn_yes DESC;
