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

#### 1. Store ID inconsistency
- `store_id` values between `sales` and `stores` tables were not fully aligned
- This affects store-level and country-level aggregations
- Results should be interpreted with caution

---

#### 2. Product ID inconsistency (critical issue)
- `product_id` formats differed between `sales` and `products`
- Direct JOIN was not possible
- A normalization approach (string manipulation) was applied to partially align identifiers
- This may introduce limitations in product-level analysis
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

 Insight: 
The business shows an approximate **40% profit margin**, indicating strong profitability and cost efficiency.

### Average Order Value (AOV)
Calculated using average revenue per order
  
 <img width="337" height="152" alt="image" src="https://github.com/user-attachments/assets/3065d838-06e9-4633-b471-88cb5f8f5447" />

Insight: 
AOV provides an overview of customer spending behavior per transaction.

## Product Analysis

### Limitation
Due to inconsistent `product_id` formats, reliable JOINs between `sales` and `products` were not possible.

As a result:
- Product-level analysis is partially limited
- Aggregated insights may contain inconsistencies

<img width="968" height="544" alt="image" src="https://github.com/user-attachments/assets/392d3285-b7b7-45f7-94b9-a2ad6cd5144a" />

### Observations (exploratory only)
- Dark chocolate appears to be the strongest-performing segment
- Demand is concentrated among a small number of products

**Note:**  
All product-level insights should be interpreted with caution due to data limitations.



## Category Analysis

### Issue
- Product and sales tables could not be reliably joined

 <img width="891" height="316" alt="image" src="https://github.com/user-attachments/assets/1d593e1b-aa71-4581-9ec1-f6bf6d8e764e" />

### Impact
- Category-level revenue and profit cannot be accurately calculated
- Aggregated results may contain duplication or mismatches
 

##  Discount Analysis

There is a strong negative relationship between discount level and profitability.

- No discount → highest profit (≈ 10.81)
- Low discount → moderate profit (≈ 9.71)
- Medium discount → lower profit (≈ 8.91)

<img width="563" height="272" alt="image" src="https://github.com/user-attachments/assets/96c9c2db-2fc1-41a7-a8c6-a151fc36dd60" />

Conclusion:  
Discounting directly reduces profitability and should be used strategically.


## Country Analysis

###  Issue
- Store ID mismatch between `sales` and `stores` tables

### Impact
- Country-level revenue and profit may be duplicated or inaccurate

<img width="1075" height="367" alt="image" src="https://github.com/user-attachments/assets/11a63f42-fad1-4233-9245-2bdf948758df" />
 

### Insight (high-level only)
- Geographic performance trends can still be observed
- However, exact values should be interpreted cautiously


## Executive Summary

This project analyzes chocolate sales performance using SQL to evaluate profitability, revenue drivers, and operational trends.

### Key outcomes:
- Strong overall profitability (~40% margin)
- Clear impact of discounting on profit reduction
- Some reliable high-level insights (KPIs, trends)
- Limited product and category-level analysis due to data quality issues

### Critical finding:
Data integrity issues (especially inconsistent product IDs) significantly limited relational analysis.

## Assumptions & Limitations

- No external data validation was performed
- Product-level insights are partially unreliable
- Store-level joins may introduce inaccuracies
- Analysis is best interpreted at an aggregated level

## Key Takeaways

- The business is profitable and financially stable
- Discounts significantly impact profitability
- Data modeling quality is critical for analytics success
- Aggregated KPIs are more reliable than detailed joins


## Business Recommendations

- Focus on high-performing segments (e.g., dark chocolate)
- Reduce excessive discounting to protect margins
- Improve data governance for product and store IDs
- Implement standardized primary keys across all tables
- Strengthen data validation processes before analysis
