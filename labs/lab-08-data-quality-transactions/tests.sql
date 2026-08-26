PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT 'null_email' issue,COUNT(*) n FROM suppliers WHERE email IS NULL UNION ALL SELECT 'duplicate_email',COUNT(*) FROM (SELECT email FROM suppliers WHERE email IS NOT NULL GROUP BY email HAVING COUNT(*)>1);
