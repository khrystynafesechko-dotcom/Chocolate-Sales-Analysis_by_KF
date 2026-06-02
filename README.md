 Chocolate Sales Analysis
________________________________________
###Project Overview

This project focuses on analyzing sales data to identify key business drivers, evaluate profitability, and provide actionable insights.
The dataset includes transactional data, product information, and store details. The goal is to understand sales performance across different dimensions such as time, products, stores, and customers.
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
	Dataset Description
The project is based on three tables:
1. sales
•	order_id 
•	order_date 
•	product_id 
•	store_id 
•	customer_id 
•	quantity 
•	unit_price 
•	discount 
•	revenue 
•	cost 
•	profit
2. products
•	product_id
•	product_name
•	brand
•	category
•	cocoa_percent
•	weight_g
3. stores
•	store_id
•	store_name
•	city
•	country
•	store_type

	Data Cleaning
The dataset was checked for data quality issues:
•	No NULL values were found across all columns, indicating complete data coverage.
•	No duplicates were found, indicating that each order is represented by a single record.
•	Revenue and profit calculations were validated:
o	revenue = quantity * unit_price * (1 - discount)
o	profit = revenue – cost.
Data Quality Issues
Critical issue was identified:
	1.Store ID inconsistency
The store_id field between sales and stores tables was not fully aligned. This may affect country-level and store-level aggregations (revenue, profit, order counts) and should be interpreted with caution.

	2. Inconsistent Product IDs
During the analysis, a data inconsistency was identified between the sales and products tables. The product_id field was expected to be a consistent foreign key across both datasets. However, it was found that the ID format differed between tables (e.g., different length and formatting of identifiers). As a result, a direct one-to-one join between sales and products was not possible. To address this issue, a normalization approach was applied during analysis, aligning product identifiers using string manipulation techniques to enable partial matching.
________________________________________
	Key Metrics (KPI)
Calculated key business metrics to establish a baseline understanding of overall performance.
•	Total Revenue
•	Total Profit
•	Profit Margin
•	Average Order Value
Revenue, Profit & Margin Analysis
•	Computed total revenue, total cost, and total profit  across all sales records.
•	Calculated  margin as profit / revenue to evaluate overall profitability.
•	Used aggregated metrics to assess the financial health of the business.

 <img width="984" height="189" alt="image" src="https://github.com/user-attachments/assets/757b422b-e1f0-407b-97cc-cb3d01c266e7" />

 Insight: 
The analysis of 2023–2024 sales data shows a 40% profit margin, confirming that the business is profitable and operates with strong cost efficiency.

Average Order Value

 <img width="337" height="152" alt="image" src="https://github.com/user-attachments/assets/3065d838-06e9-4633-b471-88cb5f8f5447" />

Insight: 
AOV calculated as AVG(revenue), assuming revenue is at order-level granularity.

	Product Analysis
Top 10 Products by Revenue and Profit
During the analysis, a data quality issue was identified between the sales and products tables. Due to inconsistent product_id values, a reliable join between these datasets could not be established. As a result, product-level and category-level analysis could not be performed accurately, as joins produce duplicated or mismatched records, leading to unreliable aggregated results.

<img width="968" height="544" alt="image" src="https://github.com/user-attachments/assets/392d3285-b7b7-45f7-94b9-a2ad6cd5144a" />

Insight: 
Due to data inconsistency between sales and products tables, product-level analysis was not fully reliable. However, exploratory analysis suggests: 
•	Dark chocolate appears to be the strongest-performing segment 
•	Product demand is concentrated among a small number of items 
These results should be interpreted with caution due to data limitations.


	Category Analysis
A critical issue was identified in the dataset: the sales and products tables do not share a reliable and consistent foreign key relationship. Attempts to standardize and match product_id values resulted in incorrect joins and data duplication, leading to inflated metric calculations.

 <img width="891" height="316" alt="image" src="https://github.com/user-attachments/assets/1d593e1b-aa71-4581-9ec1-f6bf6d8e764e" />

Insight: 
Due to this inconsistency, product-level metrics such as revenue, profit, and quantity by product category could not be accurately calculated. Any results derived from attempted joins should be interpreted with caution, as they may include duplicated or mismatched records.
 

	Discount Analysis

<img width="563" height="272" alt="image" src="https://github.com/user-attachments/assets/96c9c2db-2fc1-41a7-a8c6-a151fc36dd60" />

 Insight:
The results highlight a strong negative correlation between discount depth and profitability. No-discount orders achieve the highest average profit (10.81), while profitability declines progressively with low (9.71) and medium (8.91) discount levels. This indicates that discounting has a direct impact on margin erosion and should be strategically controlled to maintain profitability.


	Country Analysis

<img width="1075" height="367" alt="image" src="https://github.com/user-attachments/assets/11a63f42-fad1-4233-9245-2bdf948758df" />
 
Insight:
A data consistency issue was identified between the sales and stores tables. 
The store_id values were not fully aligned across datasets, which prevented a reliable one-to-one join. As a result, country-level metrics such as revenue, profit, and order counts may contain duplicated values and should be interpreted with caution.



	Executive Summary
This project analyzes chocolate sales performance using SQL.
The goal was to evaluate business profitability, identify key revenue drivers, and assess product and geographic performance.
While core KPIs and country-level analysis were successfully completed, data quality issues prevented reliable product-level and category-level aggregation.
This project demonstrates an end-to-end SQL analysis of sales data, including KPI calculation, exploratory analysis, and data quality assessment.
A critical limitation was identified in the dataset: inconsistent product identifiers prevented reliable product-level joins. Instead of forcing incorrect results, the analysis was adjusted to focus on accurate, transaction-level.
This highlights the importance of data integrity and proper relational design in analytical systems.

	Assumptions & Limitations
•	Analysis is based on available transactional data without external validation 
•	Product-level and category-level insights are limited due to inconsistent identifiers 
•	Results should be interpreted at an aggregated level only

	Key Takeaways
•	The business is profitable with a stable ~40% margin 
•	Geographic analysis is more reliable than product-level analysis due to data limitations 
•	Data quality issues significantly impact analytical depth 
•	Proper data modeling is critical for accurate business insights


	Business Recommendations
•	Focus on high-performing segments (e.g., Dark chocolate) as primary revenue drivers 
•	Improve data governance to ensure consistent product and store identifiers 
•	Implement a standardized product mapping system to enable reliable product-level analytics 
•	Enhance data validation processes to avoid future join inconsistencies
