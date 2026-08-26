# Lab 2 AI Prompt Contract

Generate SQLite DDL and parameterised CRUD statements for a tasks table with title, priority, due_date, completed and created_at. Enforce allowed priorities and completed as 0/1. Return SQL only, then list five tests separately.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
