-- Walmart Project Queries - MySQL

SELECT * FROM imported_data;


-- Count total records
SELECT COUNT(*) FROM imported_data;

-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM imported_data
GROUP BY payment_method;

-- Count distinct branches
SELECT COUNT(DISTINCT branch) FROM imported_data;

-- Find the minimum quantity sold
SELECT MIN(quantity) FROM imported_data;

-- Business Problem Q1: Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(quantity) AS no_qty_sold
FROM imported_data
GROUP BY payment_method;

-- Project Question #2: Identify the highest-rated category in each branch

-- Display the branch, category, and avg rating
SELECT t.branch, t.category, t.avg_rating
FROM (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating
    FROM imported_data
    GROUP BY branch, category
) t
JOIN (
    SELECT 
        branch,
        MAX(avg_rating) AS max_rating
    FROM (
        SELECT 
            branch,
            category,
            AVG(rating) AS avg_rating
        FROM imported_data
        GROUP BY branch, category
    ) x
    GROUP BY branch
) m
ON t.branch = m.branch AND t.avg_rating = m.max_rating;

-- Q3: Identify the busiest day for each branch based on the number of transactions
SELECT t.branch, t.day_name, t.no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions
    FROM imported_data
    GROUP BY branch, day_name
) t
JOIN (
    SELECT 
        branch,
        MAX(no_transactions) AS max_trans
    FROM (
        SELECT 
            branch,
            DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
            COUNT(*) AS no_transactions
        FROM imported_data
        GROUP BY branch, day_name
    ) x
    GROUP BY branch
) m
ON t.branch = m.branch AND t.no_transactions

-- Q4: Calculate the total quantity of items sold per payment method
SELECT 
    payment_method,
    SUM(quantity) AS no_qty_sold
FROM imported_data
GROUP BY payment_method;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city
SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM imported_data
GROUP BY city, category;

-- Q6: Calculate the total profit for each category
SELECT 
    category,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM imported_data
GROUP BY category
ORDER BY total_profit DESC;

-- Q7: Determine the most common payment method for each branch
SELECT t.branch, t.payment_method
FROM (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans
    FROM imported_data
    GROUP BY branch, payment_method
) t
JOIN (
    SELECT 
        branch,
        MAX(total_trans) AS max_trans
    FROM (
        SELECT 
            branch,
            payment_method,
            COUNT(*) AS total_trans
        FROM imported_data
        GROUP BY branch, payment_method
    ) x
    GROUP BY branch
) m
ON t.branch = m.branch 
AND t.total_trans = m.max_trans;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
    branch,
    CASE 
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM imported_data
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

-- Q9: Identify the 3 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(
        ((r2022.revenue - r2023.revenue) / r2022.revenue) * 100,
        2
    ) AS revenue_decrease_ratio
FROM (
    SELECT 
        branch,
        SUM(CAST(unit_price AS DECIMAL(10,2)) * quantity) AS revenue
    FROM imported_data
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
) r2022
JOIN (
    SELECT 
        branch,
        SUM(CAST(unit_price AS DECIMAL(10,2)) * quantity) AS revenue
    FROM imported_data
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
) r2023
ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;
