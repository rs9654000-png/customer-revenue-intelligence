SELECT 
    p.product_name,
    r.region,
    SUM(s.revenue) AS total_revenue
FROM sales_fact s
JOIN dim_product p ON s.product_key = p.product_key
JOIN dim_region r ON s.region_key = r.region_key
GROUP BY p.product_name, r.region;

SELECT SUM(profit) AS total_profit
FROM sales_fact;

SELECT 
    r.region,
    SUM(s.revenue) AS total_revenue
FROM sales_fact s
JOIN dim_region r 
ON s.region_key = r.region_key
GROUP BY r.region;
SELECT 
SUM(revenue) AS total_revenue,
SUM(profit) AS total_profit
FROM sales_fact;
SELECT 
r.region,
SUM(s.revenue) AS total_revenue
FROM sales_fact s
JOIN dim_region r
ON s.region_key = r.region_key
GROUP BY r.region
ORDER BY total_revenue DESC;
SELECT 
p.product_name,
SUM(s.revenue) AS total_revenue
FROM sales_fact s
JOIN dim_product p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;
SELECT 
AVG(discount) AS avg_discount,
SUM(revenue) AS total_revenue
FROM sales_fact;
SELECT 
SUM(revenue) AS total_revenue,
SUM(profit) AS total_profit,
SUM(quantity) AS total_units_sold
FROM sales_fact;
SELECT 
r.region,
SUM(s.revenue) AS total_revenue
FROM sales_fact s
JOIN dim_region r
ON s.region_key = r.region_key
GROUP BY r.region
ORDER BY total_revenue DESC;
SELECT TOP 10
c.customer_id,
SUM(s.revenue) AS total_revenue
FROM sales_fact s
JOIN dim_customer c
ON s.customer_key = c.customer_key
GROUP BY c.customer_id
ORDER BY total_revenue DESC;
SELECT 
p.product_name,
SUM(s.revenue) AS total_revenue,
SUM(s.profit) AS total_profit
FROM sales_fact s
JOIN dim_product p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_profit DESC;
--monthly revenue trend
SELECT 
d.year,
d.month,
SUM(s.revenue) AS monthly_revenue
FROM [dbo].[sales_fact] s
JOIN dim_date d
ON CONVERT(date,cast(s.date_key as varchar(8))) = d.order_date
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
select top 5 * from [dbo].[dim_date] ;

--revenue by region
SELECT 
    r.region,
    SUM(s.revenue) AS total_revenue,
    SUM(s.profit) AS total_profit
FROM dbo.sales_fact s
JOIN dbo.dim_region r
ON s.region_key = r.region_key
GROUP BY r.region
ORDER BY total_revenue DESC;
--profit by product category
SELECT 
    p.category,
    SUM(s.revenue) AS total_revenue,
    SUM(s.profit) AS total_profit
FROM dbo.sales_fact s
JOIN dbo.dim_product p
ON s.product_key = p.product_key
GROUP BY p.category
ORDER BY total_profit DESC;
--discount impact analysis
SELECT 
    AVG(discount) AS avg_discount,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM dbo.sales_fact;
