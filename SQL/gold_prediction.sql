CREATE OR REPLACE TABLE `incubeta-screening.retail_gold.analytics_customer_segments` AS
SELECT
  *
FROM ML.PREDICT(
  MODEL `incubeta-screening.retail_gold.customer_segments_model`,
  (
    SELECT
      *
    FROM `incubeta-screening.retail_silver.cleaned_transactions`
  )
);