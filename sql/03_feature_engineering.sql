/* =========================================================
   File: 03_feature_engineering.sql
   Project: Vodafone Customer Churn Analysis
   Purpose:
   - Create derived features for analysis
   - Generate churn flag for numerical analysis
   - Group customer tenure into meaningful categories
   ========================================================= */

use vodafone_churn;

select * from customers;


-- Create Churn Flag (0 / 1) - add new column
ALTER TABLE customers
ADD churn_flag INT;

-- Populate churn_flag
UPDATE customers
SET churn_flag = 
  CASE 
    WHEN Churn = 'Yes' THEN 1
    ELSE 0
  END;
  
  
  
SELECT Churn, churn_flag, COUNT(*)
FROM customers
GROUP BY Churn, churn_flag;



-- -----------------------------------------------------

-- Add tenure_group Column

ALTER TABLE customers
ADD tenure_group VARCHAR(20);

-- populate tenure group

UPDATE customers
SET tenure_group =
  CASE
    WHEN tenure < 12 THEN '0-1 year'
    WHEN tenure BETWEEN 12 AND 24 THEN '1-2 years'
    WHEN tenure BETWEEN 25 AND 48 THEN '2-4 years'
    ELSE '4+ years'
  END;


SELECT tenure_group, COUNT(*)
FROM customers
GROUP BY tenure_group;