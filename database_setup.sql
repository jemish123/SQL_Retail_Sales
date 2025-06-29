CREATE DATABASE SQL_Projects_DB;


-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transactions_id INT PRIMARY KEY,	
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


-- This will Populate the databae if you areimporting data drom a .csv file.
-- Make sure postgres user has reading access to the file. 
COPY retail_sales
	(transactions_id, sale_date, sale_time, customer_id, gender, age, category, quantiy, price_per_unit, cogs, total_sale)
FROM 
	'/tmp/SQL-retail_sales_analysis_utf.csv' DELIMITER ',' CSV HEADER;