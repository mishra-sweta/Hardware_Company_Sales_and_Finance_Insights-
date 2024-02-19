## Objective 

Generating Sales and Financial Insights for AtliQ Hardwares

## Reports -

1. Find the rows of Croma customer of fiscal year 2021 grouped by month for every product having columns Month, Product Name, Variant, Sold Quantity, Gross Price Per Item, Gross Price Total
2. Generate a monthly report for Croma India where there are two columns Month and Total Gross Price
3. Generate a yearly report for Croma India where there are two columns Fiscal Year, Total Gross Sales amount in that year from Croma
4. Top 5 customers using views
5. Top 5 markets using views
6. Top 5 products using views
7. Top contributors percentage region wise

### Stored Procedures –
1.	get_top_n_products_per_division_by_quantity_sold takes fiscal year and a top n number as input
2.	get_forecast_accuracy takes fiscal year as input
3.	get_market_badge takes market name and fiscal year as input and returns gold or silver badge depending on sold quantity
4.	get_monthly_gross_sales_for_customer takes list of names of customer as input
5.	get_top_n_customers_by_net_sales takes fiscal year and a top n number as input
6.	get_top_n_markets_by_net_sales takes fiscal year and a top n number as input
7.	get_top_n_products_by_net_sales takes fiscal year and a top n number as input

### Views –
1.	gross sales
2.	net sales 
3.	sales post invoice discount
4.	sales pre invoice discount

   
### User defined functions –
1.	get fiscal year
2.	get fiscal quarter

