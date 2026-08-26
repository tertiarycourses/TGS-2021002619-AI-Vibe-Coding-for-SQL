PRAGMA foreign_key_check;
PRAGMA integrity_check;
WITH line AS (SELECT oi.order_id,p.category,oi.qty*oi.unit_price amount FROM order_items oi JOIN products p ON p.id=oi.product_id) SELECT category,ROUND(SUM(amount),2) revenue,COUNT(DISTINCT order_id) orders FROM line GROUP BY category ORDER BY revenue DESC;
