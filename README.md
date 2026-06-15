# 🍫 Chocolate Sales Analysis
________________________________________
## Project Overview
This project focuses on analyzing chocolate sales data to identify key business drivers, evaluate profitability, and provide actionable insights.  

The dataset includes transactional data, product information, and store details.  
The goal is to understand sales performance across multiple dimensions such as time, products, stores, and customers.
________________________________________
## Tools and Technologies

### SQL
- Aggregations (`SUM`, `AVG`, `COUNT`)
- `GROUP BY`
- `CASE WHEN`
- Window Functions
- Data validation queries
- JOIN operations

### Data Visualization
- Excel
- Tableau

### Data Analysis Techniques
- Data cleaning and validation
- Exploratory Data Analysis (EDA)
- Data aggregation and transformation
________________________________________
## Dataset Description

The project is based on three main tables:

### sales
- order_id  
- order_date  
- product_id  
- store_id  
- customer_id  
- quantity  
- unit_price  
- discount  
- revenue  
- cost  
- profit  

### products
- product_id  
- product_name  
- brand  
- category  
- cocoa_percent  
- weight_g  

### stores
- store_id  
- store_name  
- city  
- country  
- store_type  

---

## Data Cleaning & Quality Checks

The dataset was validated for data quality issues:

### No issues found:
- No NULL values across all tables
- No duplicate records in sales data
- Revenue and profit calculations validated

Revenue formula:
revenue = quantity * unit_price * (1 - discount)

Profit formula:
profit = revenue - cost

### Data Quality Issues Identified
During the analysis, the following data quality issues were identified:
#### 1. Store ID Inconsistency
The store_id field was not fully consistent between the sales and stores datasets. This may have affected store-level and country-level aggregations, including revenue, profit, and order count metrics. Results based on these dimensions should therefore be interpreted with caution.
#### 2.Product ID Inconsistency
The product_id field was not standardized across the sales and products datasets, resulting in differences in identifier formatting. Due to this inconsistency, product data could not be directly matched using a standard database join. To support the analysis, product information was integrated and validated within Tableau using data relationships and transformation techniques. While this approach enabled product-level analysis, some results may be affected by the underlying data quality limitations.

________________________________________
## Key Performance Indicators (KPIs)

- Total Revenue  
- Total Profit  
- Profit Margin  
- Average Order Value (AOV)  

### Revenue & Profitability
- Overall profitability was calculated using aggregated metrics
- Profit margin formula:
 Profit Margin = Profit / Revenue

 <img width="984" height="189" alt="image" src="https://github.com/user-attachments/assets/757b422b-e1f0-407b-97cc-cb3d01c266e7" />

 **Insight:** 
The business shows an approximate **40% profit margin**, indicating strong profitability and cost efficiency.

### Average Order Value (AOV)
Calculated using average revenue per order
  
 <img width="337" height="152" alt="image" src="https://github.com/user-attachments/assets/3065d838-06e9-4633-b471-88cb5f8f5447" />

 **Insight:**
AOV provides an overview of customer spending behavior per transaction.

__________________________________________
## Product Analysis
Analyzed product performance to identify key revenue and profit drivers across the product portfolio.
Product-level analysis was conducted in Tableau using data relationships and transformation techniques due to inconsistencies in the product_id field between the sales and products datasets. While this approach enabled the analysis, product-level results should be interpreted with caution as some matches may be affected by the underlying data quality issues.

**Top 10 Products by Revenue and Profit**

<img width="1090" height="353" alt="image" src="https://github.com/user-attachments/assets/96ff9a7d-30c1-4e02-82b2-f673577eaf1b" />

<img width="1090" height="336" alt="image" src="https://github.com/user-attachments/assets/d8ee06fb-1dcb-4d90-a4b1-6066e2d6e43d" />


 **Insight:**
 The product performance analysis revealed that a small group of products contributed the most to overall revenue and profit, with Dark Chocolate 50% emerging as the leading product in both metrics.


**Category Analysis**

<img width="1090" height="344" alt="image" src="https://github.com/user-attachments/assets/8ff583c9-e79d-4a2b-9107-5f6245ae9660" />

 **Insight:**
 Based on the product category analysis, Proline emerged as the leading category, generating the highest revenue and profit.

**Profit Margin by Product**

<img width="1090" height="469" alt="image" src="https://github.com/user-attachments/assets/f3244617-4930-468d-8646-9d4585482f39" />

 **Insight:**
 Milk Chocolate 90% has the highest profit margin, indicating strong profitability despite potentially lower sales volume.
 
______________________________________________
## Country Analysis
Country-level analysis is based on aggregated data after resolving inconsistencies in underlying identifiers. Results should be interpreted with consideration of data limitations.

<img width="1090" height="419" alt="image" src="https://github.com/user-attachments/assets/b6d9bff0-7569-4704-8a75-b5ee92627041" />

 **Insight:**
Canada is the top-performing country in terms of both revenue and profit from chocolate sales.

**Profit Margin by Country**

<img width="889" height="369" alt="image" src="https://github.com/user-attachments/assets/653aa297-69ac-4cf2-b5ab-d805a6f1fcb5" />

 **Insight:**
 The highest profit margin is observed in the United Kingdom.
 
 _________________________________________________
##  Discount Analysis

There is a strong negative relationship between discount level and profitability.

- No discount → highest profit (≈ 10.81)
- Low discount → moderate profit (≈ 9.71)
- Medium discount → lower profit (≈ 8.91)

<img width="563" height="272" alt="image" src="https://github.com/user-attachments/assets/96c9c2db-2fc1-41a7-a8c6-a151fc36dd60" />

 **Insight:**  
Discounting directly reduces profitability and should be used strategically.
________________________________________________________
## Dashboard
The Tableau dashboard visualizes the results of the sales analysis, including key KPIs, profit trends, top products, brand performance, and geographic distribution of sales.

![Dashboard](<img width="1090" height="613" alt="image" src="https://github.com/user-attachments/assets/42da4187-64fe-439a-836c-f50b4390f6d6" />)


_______________________________________________________
## Executive Summary

This project analyzes chocolate sales performance using SQL and Tableau.

- While core KPIs and country-level analysis were successfully completed in PostgreSQL, limitations in data integration—specifically inconsistent joins across product-related tables—prevented the development of a reliable product and category-level view.

- To ensure analytical integrity, the scope of the analysis was adjusted, and product-level exploration was completed in Tableau using validated transaction-level data.

- As a result, product-level insights should be interpreted as directional rather than definitive due to underlying data modeling constraints.

__________________________________________________________
## Key Outcomes

- Built an end-to-end analytics pipeline using SQL and Tableau  
- Defined and validated core business KPIs  
- Identified key revenue drivers at the country and product level (directional insights)  
- Developed an interactive Tableau dashboard for exploratory analysis  
- Performed data quality assessment and identified data integration limitations  
- Adapted the analytical scope to ensure data integrity and reliable insights  

_____________________________________________________________
## Assumptions & Limitations

- No external data validation was performed  
- Product-level insights are partially unreliable  
- Joins at the product and country levels may introduce aggregation inaccuracies  
- The analysis is best interpreted at an aggregated level    

___________________________________________________________
## Key Takeaways

- The business demonstrates overall profitability and financial stability  
- Discount strategies have a significant impact on profitability and should be carefully managed  
- Data modeling quality is a critical factor in ensuring reliable analytical outcomes  
- Aggregated KPIs provide more reliable insights compared to granular-level joins due to data limitations  

__________________________________________________
## Business Recommendations

- Focus on high-performing segments (e.g., dark chocolate)  
- Reduce excessive discounting to protect margins  
- Improve data governance for product and store IDs  
- Implement standardized primary keys across all tables  
- Strengthen data validation processes before analysis  
