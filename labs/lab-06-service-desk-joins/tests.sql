PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT t.id,t.subject,r.name requester,a.name agent,ROUND((julianday('now')-julianday(t.created_at))*24,1) age_hours FROM tickets t JOIN people r ON r.id=t.requester_id LEFT JOIN people a ON a.id=t.agent_id ORDER BY (age_hours>24) DESC,age_hours DESC;
