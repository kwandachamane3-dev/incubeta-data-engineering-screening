\# Data Engineering Screening Challenge



\## Overview



This repository contains my solution for the Incubeta Data Engineering Screening Challenge.



The solution implements a Medallion Architecture in BigQuery:



\- Bronze Layer – Raw data ingestion

\- Silver Layer – Data cleansing and transformation

\- Gold Layer – Customer segmentation using BigQuery ML (K-Means)



\## Repository Structure



```

silver\_transform.sql

gold\_model\_training.sql

gold\_prediction.sql



proof/

```



\## Pipeline Orchestration



In production I would orchestrate this pipeline using Dataform or Cloud Composer.



The Bronze layer would ingest raw data, the Silver layer would perform cleaning and transformations, and the Gold layer would train the BQML model and generate customer segmentation predictions. These workflows could be scheduled using BigQuery Scheduled Queries or orchestrated with Cloud Composer to ensure dependencies are executed in the correct order.







All SQL was reviewed, executed, and validated within BigQuery before submission.

