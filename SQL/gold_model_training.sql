CREATE SCHEMA IF NOT EXISTS `incubeta-screening.retail_gold`;

CREATE OR REPLACE MODEL `incubeta-screening.retail_gold.customer_segments_model`
OPTIONS(
  MODEL_TYPE = 'KMEANS',
  NUM_CLUSTERS = 4,
  KMEANS_INIT_METHOD = 'KMEANS++',
  STANDARDIZE_FEATURES = TRUE
) AS
SELECT
  amount,
  item_category
FROM `incubeta-screening.retail_silver.cleaned_transactions`;