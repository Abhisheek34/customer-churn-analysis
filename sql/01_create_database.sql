/* =========================================================
   File: 01_create_database.sql
   Project: Vodafone Customer Churn Analysis
   Purpose:
   - Create project database
   - Set up initial schema environment
   ========================================================= */


-- Creating the database vodafone_churn
create database vodafone_churn;

use vodafone_churn;


select * from customers;

describe customers;