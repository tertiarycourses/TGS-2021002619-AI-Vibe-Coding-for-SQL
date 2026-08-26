PRAGMA foreign_key_check;
PRAGMA integrity_check;
EXPLAIN QUERY PLAN SELECT customer_id,order_date,total FROM orders WHERE customer_id=7 AND order_date>='2026-01-01' ORDER BY order_date DESC;
