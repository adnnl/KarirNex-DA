# 📊 FMCG Data Cleaning & Analysis

## Project Overview

This project focuses on cleaning a messy FMCG dataset and answering several business questions using SQL and Excel.  
The dataset was first cleaned to ensure consistent formats and accurate values before performing analysis.

## 📂 Dataset

The dataset contains FMCG sales data with several issues such as inconsistent formats and messy values.  
Two versions of the raw dataset are provided:
- **CSV file** → cleaned using SQL
- **Excel file** → cleaned using Microsoft Excel

## 📁 Repository Structure

```
.
├── Data FMCG_BT Data Analyst - Messy.csv   # Raw dataset (SQL cleaning)
├── Data FMCG_BT Data Analyst - Messy.xlsx  # Raw dataset (Excel cleaning)
├── fmcg_clean_sql.csv                      # Cleaned dataset using SQL
├── fmcg_clean.xlsx                         # Cleaned dataset using Excel
├── fmcg.sql                                # SQL database export
└── query.sql                               # SQL queries for data cleaning
```

## 🧹 Data Cleaning Steps

The dataset was cleaned before analysis. The cleaning process includes:

1. Convert **sales_date** to the correct date data type
2. Remove duplicate records based on **order_id**
3. Trim whitespace in the **product_name** column
4. Standardize text formatting in the **category** column (proper case)
5. Replace invalid **quantity** value `-99` with `1`
6. Fill missing values in the **total** column
7. Fill missing values in the **total_sales** column
8. Normalize values in the **channel** column
9. Standardize text formatting in the **status** column
10. Remove rows containing **NULL values**

## 📌 Task 1

Based on the FMCG dataset, clean the data first, then answer the following questions using SQL or Excel:
1. How many cities are listed in the customer_address column?
2. What is the total sum of total_sales?
3. How many orders were made in Toko Hijau?
4. How many unique customers have made purchases?
5. How many times have Putra and Putri made purchases, how much money have they spent, and how many items have they bought?

## 🛠 Tools Used

- SQL
- Microsoft Excel
- Power BI
- GitHub

## 📅 Project Status

Task 1 completed.  
More tasks will be added as the project progresses.
