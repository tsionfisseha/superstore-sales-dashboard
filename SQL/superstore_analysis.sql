-- Superstore Sales Analysis
-- Project 2 - Data Analyst Portfolio


-- Query 1: Preview dataset
SELECT *
FROM superstore
LIMIT 10;


-- Query 2: Total Sales and Profit by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Query 3: Sales by State

SELECT
    State,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 4: Top 10 Most Profitable Products

SELECT
    "Product Name",
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- Query 5: Products With Negative Profit

SELECT
    "Product Name",
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC
LIMIT 10;

-- Query 6: Monthly Sales Trend

SELECT
    substr("Order Date", -4) || '-' ||
    substr("Order Date", 1, 2) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;

-- Query 7: Profit Margin by Category

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;