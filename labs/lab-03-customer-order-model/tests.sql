PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT c.name, COUNT(DISTINCT o.id) orders, ROUND(SUM(oi.qty*oi.unit_price),2) revenue FROM customers c JOIN orders o ON o.customer_id=c.id JOIN order_items oi ON oi.order_id=o.id GROUP BY c.id,c.name ORDER BY revenue DESC;
