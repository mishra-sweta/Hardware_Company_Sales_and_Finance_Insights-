-- 1.

SELECT s.date,s.product_code,p.product,p.variant,s.sold_quantity,g.gross_price, round(s.sold_quantity*g.gross_price,2) as total_gross_price
FROM fact_sales_monthly s
JOIN dim_product p
on s.product_code = p.product_code
JOIN fact_gross_price g
on g.product_code=s.product_code and g.fiscal_year=get_fiscal_year(s.date)
Where customer_code=90002002 and get_fiscal_year(date)=2021
ORDER BY date asc;

-- 2

SELECT s.date, SUM(s.sold_quantity * g.gross_price) as total_gross_price
FROM fact_sales_monthly s
JOIN fact_gross_price g
on s.product_code=g.product_code and g.fiscal_year = get_fiscal_year(s.date)
WHERE customer_code=90002002
Group by s.date;

-- 3

SELECT g.fiscal_year, SUM(s.sold_quantity * g.gross_price) as total_yearly_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g
on s.product_code=g.product_code and g.fiscal_year = get_fiscal_year(s.date)
WHERE customer_code=90002002
Group by g.fiscal_year;

-- 4

SELECT c.customer, round(sum(net_sales)/1000000,2) as net_sales_mln 
FROM gdb0041.net_sales n
JOIN dim_customer c
ON c.customer_code=n.customer_code
WHERE fiscal_year=2021
GROUP BY c.customer
ORDER BY net_sales_mln DESC
LIMIT 5 ;

-- 5

SELECT market, round(sum(net_sales)/1000000,2) as net_sales_mln 
FROM gdb0041.net_sales
WHERE fiscal_year=2021
GROUP BY market
ORDER BY net_sales_mln DESC
LIMIT 5 ;

-- 6

SELECT product, round(sum(net_sales)/1000000,2) as net_sales_mln 
FROM gdb0041.net_sales 
WHERE fiscal_year=2021
GROUP BY product
ORDER BY net_sales_mln DESC
LIMIT 5 ;

-- 7

with cte1 as
(SELECT c.customer,c.region ,round(sum(net_sales)/1000000,2) as net_sales_mln
FROM gdb0041.net_sales n
JOIN dim_customer c
ON c.customer_code=n.customer_code
WHERE fiscal_year=2021
GROUP BY c.customer,c.region
ORDER BY net_sales_mln DESC )

SELECT *,(net_sales_mln*100)/sum(net_sales_mln) over(partition by region) as contribution_pct 
FROM cte1