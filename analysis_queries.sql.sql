-- Total Metrics
SELECT 
    SUM(price) AS revenue,
    SUM(cost + shipping_cost + commission + ad_cost) AS total_cost,
    SUM(price - (cost + shipping_cost + commission + ad_cost)) AS profit
FROM public.ecommerce_profit_dataset;

-- Category Profitability
SELECT 
    category,
    SUM(price) AS revenue,
    SUM(price - (cost + shipping_cost + commission + ad_cost)) AS profit
FROM public.ecommerce_profit_dataset
GROUP BY category
ORDER BY profit DESC;

-- Top Loss-Making Products
SELECT 
    product,
    SUM(price) AS revenue,
    SUM(price - (cost + shipping_cost + commission + ad_cost)) AS profit
FROM public.ecommerce_profit_dataset
GROUP BY product
ORDER BY profit ASC
LIMIT 10;