# MIMIC Data Extraction Code Documentation 

 [For Chinese Version Click here](./README_CN.md)

This project contains SQL scripts for extracting research-related data from 
the  [MIMIC-IV v3.1](https://physionet.org/content/mimiciv/3.1/) database. It is designed to
 support the data analysis needs of the paper titled **"Relationship Between the Duration of Early Vital Sign Abnormalities in Acute Cardiovascular Diseases and 120-Day Mortality Risk: Determination of Clinically Relevant Thresholds"**.

---

## 📌 Research Overview

The code aims to extract key variables related to the study topic from the MIMIC database, including patient demographics, admission records, vital signs, laboratory tests, and diagnostic information.

---

## 🧩 Data Source

- **Database Version**: MIMIC-IV v3.1
- **Access Method**: Via PostgreSQL database connection (requires permission)
- **Official Documentation**: https://physionet.org/content/mimiciv/3.1/

---

## 🛠️ Usage Instructions

### 1. Environment Setup

Ensure the following tools are installed:
- PostgreSQL client (e.g., `psql` or DBeaver)
- DataGrip
- Python 
- Navicat 

### Modified and Customized Materialized Views
[mimic-code-main-revised](./mimic-code-main-revised)

[Mimic database custom materialized view](./Mimic_database_custom_materialized_view)

### Data Extraction Workflow
- First, run the SQL scripts under [mimic-code-main-revised](./mimic-code-main-revised) to restructure the dataset by adding the `hadm_id` column to the official materialized views.

- Then, execute the SQL script in [Mimic database custom materialized view](./Mimic_database_custom_materialized_view) to define longitudinal data for various metrics.

- Finally, extract required indicators as needed.
