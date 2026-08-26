PRAGMA foreign_key_check;
PRAGMA integrity_check;
SELECT name, sql FROM sqlite_master WHERE type='table' ORDER BY name;
