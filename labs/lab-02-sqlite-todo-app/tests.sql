PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT id,title,priority,due_date,completed FROM tasks ORDER BY completed, CASE priority WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END, due_date;
