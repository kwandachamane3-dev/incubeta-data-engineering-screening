CREATE SCHEMA IF NOT EXISTS `incubeta-screening.retail_silver`;


CREATE OR REPLACE TABLE `incubeta-screening.retail_silver.cleaned_transactions` AS
WITH staged AS (
SELECT
TRIM(CAST(transaction_id AS STRING)) AS transaction_id,
TRIM(CAST(customer_id AS STRING)) AS customer_id,
SAFE_CAST(CAST(signup_date AS STRING) AS DATE) AS signup_date_raw, SAFE_CAST(CAST(purchase_date AS STRING) AS DATE) AS purchase_date,
SAFE_CAST(CAST(amount AS STRING) AS NUMERIC) AS amount, 
TRIM(CAST(item_category AS STRING)) AS item_category, 
CASE
WHEN is_returned IS NULL THEN FALSE 
WHEN LOWER(TRIM(CAST(is_returned AS STRING))) IN ('true', 't', '1', 'yes', 'y') THEN 
TRUE 
	WHEN LOWER(TRIM(CAST(is_returned AS STRING))) IN ('false', 'f', '0', 'no', 'n') THEN FALSE 
	ELSE FALSE 
	END AS is_returned 
FROM `incubeta-screening.retail_bronze.raw_transactions` 
), 
cleaned AS ( 
  SELECT 
  	transaction_id, customer_id, 
  	COALESCE(signup_date_raw, purchase_date) AS signup_date, 
  	purchase_date, amount, item_category, is_returned, 
	DATE_DIFF( purchase_date, COALESCE(signup_date_raw, purchase_date), DAY ) AS 	days_to_first_purchase FROM staged ) 

SELECT * 
FROM cleaned WHERE amount > 0 AND transaction_id IS NOT NULL AND customer_id IS NOT NULL AND purchase_date IS NOT NULL;