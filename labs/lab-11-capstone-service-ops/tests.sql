PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT status,priority,COUNT(*) tickets,ROUND(AVG((julianday(COALESCE(closed_at,'now'))-julianday(created_at))*24),1) avg_hours FROM tickets GROUP BY status,priority ORDER BY status,priority;
