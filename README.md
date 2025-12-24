Walmart Sales Data Analysis

![image alt](https://github.com/Yweb20/Walmart_Sales_Data_Analysis/blob/b51c5a47fb98dc8893b184617541332b8ef20e59/Walmart.jpeg)

Overview

This project is an end-to-end SQL-based data analysis solution built to extract meaningful business insights from Walmart sales data. Unlike Python-heavy pipelines, this project focuses on database design, data cleaning, and advanced SQL querying to solve real-world business problems.

The objective is to demonstrate strong fundamentals in relational databases, SQL analytics, and business-oriented thinking, making this project ideal for aspiring Data Analysts and Associate Software roles that require hands-on SQL expertise.

Dataset

Source: Kaggle – Walmart Sales Dataset

Access Method: Kaggle API

Data Type: Transaction-level retail sales data

Storage: Imported directly into SQL database tables

The dataset includes information such as branch, city, product category, quantity, unit price, payment method, ratings, date, and time.

Tools and Technologies

Database: MySQL (Primary)

Query Language: SQL

Environment: Visual Studio Code

Data Source: Kaggle API

Version Control: Git & GitHub

Project Steps
1. Environment Setup

Configured a structured project workspace using VS Code

Set up MySQL database and schema for sales data

2. Kaggle API Configuration

Generated Kaggle API token from Kaggle profile

Configured kaggle.json locally

Downloaded dataset using Kaggle CLI

3. Data Ingestion into SQL

Imported raw CSV data into MySQL tables

Verified schema, column types, and data consistency

4. Data Cleaning in SQL

Removed duplicate records

Handled missing or invalid values

Standardized date, time, and numeric fields

Ensured proper data types for analysis

5. Feature Engineering (SQL)

Created calculated columns such as total sales amount

Derived time-based attributes (hour, day, month) for trend analysis

6. Business-Oriented SQL Analysis

Executed complex SQL queries to answer key business questions:

Revenue trends across branches and cities

Best-selling and most profitable product categories

Sales distribution by payment method

Peak sales hours and customer purchase patterns

Branch-wise and category-wise performance comparison

7. Validation & Optimization

Cross-checked query outputs for accuracy

Optimized queries using proper filtering and aggregation techniques

8. Documentation & Publishing

Documented queries and insights clearly

Organized SQL scripts for readability and reuse

Published project on GitHub with structured README

Key Results and Insights

Sales Performance: Identified top-performing branches and cities

Product Insights: Determined high-revenue and high-volume product categories

Customer Behavior: Observed preferred payment methods and peak shopping hours

Time-Based Trends: Found daily and monthly sales patterns useful for planning

These insights can directly support inventory planning, pricing strategy, and operational optimization.

How to Run the Project

Clone the repository:

git clone <your-repo-url>

Set up MySQL database and create a new schema

Download the dataset using Kaggle API

Import CSV files into MySQL tables

Execute SQL scripts from the sql_queries/ folder

Review query outputs and insights

Project Structure
|-- data/              # Raw dataset files
|-- sql_queries/       # SQL scripts for analysis
|-- README.md          # Project documentation
License

This project is licensed under the MIT License.
