PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT sku,name,stock,reorder_level, CASE WHEN stock<=reorder_level THEN 'REORDER' ELSE 'OK' END status FROM products ORDER BY status DESC, stock;
