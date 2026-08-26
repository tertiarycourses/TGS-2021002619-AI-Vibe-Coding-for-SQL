PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT d.month_name,p.category,ROUND(SUM(f.sales_amount),2) sales FROM fact_sales f JOIN dim_date d ON d.date_key=f.date_key JOIN dim_product p ON p.product_key=f.product_key GROUP BY d.month_name,p.category ORDER BY d.date_key,p.category;
