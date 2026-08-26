PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT order_no,customer_name,status,total,order_date FROM orders WHERE status='Paid' AND order_date>='2026-08-01' ORDER BY total DESC LIMIT 10;
