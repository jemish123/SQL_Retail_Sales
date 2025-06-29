# Analyis on Retail Sales Data

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `SQL_Projects_DB`

The purpose of this project is to showcase the SQL abilities and methods that data analysts commonly employ to examine, purify, and evaluate retail sales data.  Setting up a retail sales database, conducting exploratory data analysis (EDA), and using SQL queries to address certain business concerns are all part of the project.  For individuals who are just beginning their data analysis career and wish to establish a strong foundation in SQL, this project is perfect.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `SQL_Projects_DB`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
-- Create a Database named "SQL_Projects_DB"
CREATE DATABASE SQL_Projects_DB;


-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
-- Record Counts
SELECT COUNT(*) FROM retail_sales;

-- Distinct Customer Counts
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales

-- Category Counts
SELECT DISTINCT category FROM retail_sales;

-- Check for record with null data and deletes those records.
DELETE
    FROM retail_sales
WHERE 
    transaction_id IS NULL OR
    sale_date IS NULL OR 
    sale_time IS NULL OR
    gender IS NULL OR
    category IS NULL OR
    quantity IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Make a query to fetch all columns for sales made on '2022-11-14**:
```sql
SELECT
    *
FROM retail_sales
    WHERE sale_date = '2022-11-14';
```

2. **Create a SQL query to get all transactions in the month of November 2022 with the category "Clothing" and a quantity sold more than three.**:
```sql
select
    *
from retail_sales 
	where category='Clothing' and quantiy > 3 and TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
select
    category, sum(total_sale) as "Total Sales"
from retail_sales
    group by category;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select
    round(avg(age),2) as "Average age who buy Beauty Products"
from retail_sales
    where category='Beauty';  
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1500.**:
```sql
select
    *
from retail_sales
    where total_sale > 1500;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
select
    category, gender, count(*) as "Total Sales"
from retail_sales
    group by category, gender; 
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
select
    year, month, sales
from 
	(
        select 
    		extract(year from sale_date) as year,
    		extract(month from sale_date) as month,
    		avg(total_sale) as sales,
    		rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
    	from retail_sales
		    group by year, month
    ) as ranked_data 
    where rank=1;
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
select 
	customer_id, sum(total_sale) as total_sales 
from retail_sales 
	group by customer_id 
	order by total_sales desc 
	limit 5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
select 
	category, count(distinct customer_id) as number_of_customers
from retail_sales
	group by category;
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
with shift_sales 
    as
    (
        select *,
    		case 
    			when extract(hour from sale_time) < 12 then 'Morning'
    			when extract(hour from sale_time) >= 12 and extract(hour from sale_time) <= 17 then 'Afternoon'
    			else 'Evening'
    		end as shift 
    	from retail_sales
    ) select 
		shift, count(*)
	from shift_sales 
		group by shift;
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1500, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in the `database_setup.sql` file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the `analysis_queries.sql` file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## Author - Jemish Mangukiya(Innovastra Solutions)

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

Thank you for your support, and I look forward to connecting with you!

LinkedIn Profile: https://www.linkedin.com/in/jemish005/
